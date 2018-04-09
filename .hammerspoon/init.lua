-- Hammerspoon Config File --

function reloadConfig(files)
	doReload = false
	for _,file in pairs(files) do
		if file:sub(-4) == '.lua' then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end

function setCaffeineDisplay(state)
	if state then
		caffeine:setTitle("😳")
	else
		caffeine:setTitle("😴")
	end
end

function caffeineClicked()
	setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then 
	caffeine:setClickCallback(caffeineClicked)
	setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

function movedToBatteryPower()
	hs.console.printStyledtext('movedToBatteryPower')
	-- Reset caffeinate menubar
	hs.caffeinate.set("displayIdle", false, true)
	setCaffeineDisplay(false)
	-- Mute audio
	outputDevice = hs.audiodevice.current(false)
	if outputDevice.device:setMuted(true) then
		hs.alert.show(outputDevice.name .. ' muted')
	end

end

function movedToACPower()
	hs.console.printStyledtext('movedToACPower')
end

function batteryStateChanged() 
	local power = hs.battery
	local powerSource = power.powerSource()
	
	if currentPowerSource == powerSource then 
		return 
	end

	currentPowerSource = powerSource

	if powerSource == "Battery Power" then
		movedToBatteryPower()
	elseif powerSource == "AC Power" then
		movedToACPower()
	end
end

function usbDeviceChanged(usbChange)
	local name = usbChange["productName"]
	local eventType = usbChange["eventType"]
	hs.console.printStyledtext(name .. " " .. eventType)
end

myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

caffeine = hs.menubar.new()

currentPowerSource = hs.battery.powerSource()
batteryWatcher = hs.battery.watcher.new(batteryStateChanged)
batteryWatcher:start()

usbWatcher = hs.usb.watcher.new(usbDeviceChanged)
usbWatcher:start()
