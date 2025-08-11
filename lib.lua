repeat task.wait() until game:IsLoaded()
game:GetService("UserInputService").MouseIconEnabled = true
if _G.fmcon then
	_G.fmcon:Disconnect()
	_G.fmcon = nil
end
if game:GetService("RunService"):IsStudio() then
	game.Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui"):Destroy()
end
if gethui and gethui():FindFirstChild("neptz") then
	gethui():FindFirstChild("neptz"):Destroy()
end

local lib = {}

function lib.Window(title, gameName, settings)
	local settings = {
		RgbSpeed = 100 / ((settings or {}).RgbSpeed or 10),
		TweenSpeed = ((settings or {}).TweenSpeed or 15)
	}
	local colorUpdate = Instance.new("BindableEvent")
	task.spawn(function()
		while task.wait() do
			local hsv = Color3.fromHSV(tick() / settings.RgbSpeed % 1, 1, 1)
			colorUpdate:Fire(hsv, tick() / settings.RgbSpeed % 1)
		end
	end)
	
	local ScreenGui = Instance.new("ScreenGui")
	local StrokeOuter = Instance.new("Frame")
	local StrokeBorder = Instance.new("Frame")
	local InsideContent = Instance.new("Frame")
	local TabsOuter = Instance.new("Frame")
	local TabsBorder = Instance.new("Frame")
	local TabsContent = Instance.new("Frame")
	local ScriptTitle = Instance.new("TextLabel")
	local TabsScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Name = "neptz"

	StrokeOuter.Name = "StrokeOuter"
	StrokeOuter.Parent = ScreenGui
	StrokeOuter.AnchorPoint = Vector2.new(0.5, 0.5)
	StrokeOuter.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	StrokeOuter.BorderColor3 = Color3.fromRGB(0, 0, 0)
	StrokeOuter.BorderSizePixel = 0
	StrokeOuter.Position = UDim2.new(0.5, 0, 0.5, 0)
	StrokeOuter.Size = UDim2.new(0, 600, 0, 310)

	StrokeBorder.Name = "StrokeBorder"
	StrokeBorder.Parent = StrokeOuter
	StrokeBorder.AnchorPoint = Vector2.new(0.5, 0.5)
	--StrokeBorder.BackgroundColor3 = Color3.fromRGB(19, 255, 106)
	StrokeBorder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	StrokeBorder.BorderSizePixel = 0
	StrokeBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
	StrokeBorder.Size = UDim2.new(1, -2, 1, -2)

	InsideContent.Name = "InsideContent"
	InsideContent.Parent = StrokeBorder
	InsideContent.AnchorPoint = Vector2.new(0.5, 0.5)
	InsideContent.BackgroundColor3 = Color3.fromRGB(29, 30, 29)
	InsideContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	InsideContent.BorderSizePixel = 0
	InsideContent.Position = UDim2.new(0.5, 0, 0.5, 0)
	InsideContent.Size = UDim2.new(1, -2, 1, -2)

	TabsOuter.Name = "TabsOuter"
	TabsOuter.Parent = InsideContent
	TabsOuter.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TabsOuter.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabsOuter.BorderSizePixel = 0
	TabsOuter.Position = UDim2.new(0, 7, 0, 7)
	TabsOuter.Size = UDim2.new(0, 150, 1, -14)

	TabsBorder.Name = "TabsBorder"
	TabsBorder.Parent = TabsOuter
	TabsBorder.AnchorPoint = Vector2.new(0.5, 0.5)
	TabsBorder.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
	TabsBorder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabsBorder.BorderSizePixel = 0
	TabsBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
	TabsBorder.Size = UDim2.new(1, -2, 1, -2)

	TabsContent.Name = "TabsContent"
	TabsContent.Parent = TabsBorder
	TabsContent.AnchorPoint = Vector2.new(0.5, 0.5)
	TabsContent.BackgroundColor3 = Color3.fromRGB(20, 23, 20)
	TabsContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabsContent.BorderSizePixel = 0
	TabsContent.Position = UDim2.new(0.5, 0, 0.5, 0)
	TabsContent.Size = UDim2.new(1, -2, 1, -2)

	ScriptTitle.Name = "ScriptTitle"
	ScriptTitle.Parent = TabsContent
	ScriptTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScriptTitle.BackgroundTransparency = 1.000
	ScriptTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScriptTitle.BorderSizePixel = 0
	ScriptTitle.Size = UDim2.new(1, 0, 0, 20)
	ScriptTitle.Font = Enum.Font.RobotoMono
	ScriptTitle.Text = title .. " - " .. gameName
	ScriptTitle.TextColor3 = Color3.fromRGB(194, 194, 194)
	ScriptTitle.TextSize = 14.000

	TabsScrollingFrame.Name = "TabsScrollingFrame"
	TabsScrollingFrame.Parent = TabsContent
	TabsScrollingFrame.Active = false
	TabsScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabsScrollingFrame.BackgroundTransparency = 1.000
	TabsScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabsScrollingFrame.BorderSizePixel = 0
	TabsScrollingFrame.Position = UDim2.new(0, 0, 0, 25)
	TabsScrollingFrame.Size = UDim2.new(1, 0, 1, -35)
	TabsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabsScrollingFrame.ScrollBarThickness = 0

	UIListLayout.Parent = TabsScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)
	local dragToggle
	do
		local UIS = game:GetService("UserInputService")
		local dragSpeed = 0.15
		local dragInput = nil
		local dragStart = nil
		local dragPos = nil
		local Delta
		local Position
		local startPos
		local function updateInput(input)
			Delta = input.Position - dragStart
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(StrokeOuter, TweenInfo.new(1 / settings.TweenSpeed), {Position = Position}):Play()
		end
		StrokeOuter.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = StrokeOuter.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		StrokeOuter.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UIS.InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	
	colorUpdate.Event:Connect(function(hsv)
		StrokeBorder.BackgroundColor3 = hsv
	end);
	
	
	(function()
		if not game:GetService("RunService"):IsStudio() then
			ScreenGui.OnTopOfCoreBlur = true
			ScreenGui.Parent = gethui()
			ScreenGui.DisplayOrder = 9999999
			
			local UIS = game:GetService("UserInputService")
			if UIS.MouseEnabled == false then return end
			local fakemouse = Instance.new("ImageLabel")
			
			local ScreenGui = Instance.new("ScreenGui")
			ScreenGui.Parent = gethui()
			ScreenGui.OnTopOfCoreBlur = true
			ScreenGui.DisplayOrder = 9999999+1
			ScreenGui.ResetOnSpawn = false
			ScreenGui.Enabled = true
			
			fakemouse.Parent = ScreenGui
			fakemouse.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			fakemouse.BackgroundTransparency = 1.000
			fakemouse.BorderColor3 = Color3.fromRGB(0, 0, 0)
			fakemouse.BorderSizePixel = 0
			fakemouse.Size = UDim2.fromOffset(16, 16)
			fakemouse.Image = "rbxassetid://80969788083542"
			fakemouse.Visible = true
			fakemouse.ZIndex = 9999999
			fakemouse.ImageColor3 = Color3.fromRGB(200, 200, 200)
			
			local mousing=false
			StrokeOuter.MouseEnter:Connect(function()mousing=true;end)
			StrokeOuter.MouseLeave:Connect(function()mousing=false;end)
			local mwouse = game:GetService("Players").LocalPlayer:GetMouse()
			_G.fmcon = game:GetService("RunService").RenderStepped:Connect(function()
				ScreenGui.Enabled = mousing
				fakemouse.Position = UDim2.fromOffset(mwouse.X, mwouse.Y)
				if dragToggle then return end
				UIS.MouseIconEnabled = not mousing
			end)
			
		else
			ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
		end
	end)();
	
	local windowData = {}
	
	function windowData.Tab(name)
		if not settings.PRIVATE_Pages then
			settings.PRIVATE_Pages = 0
		end
		settings.PRIVATE_Pages = settings.PRIVATE_Pages + 1
		
		local tabData = {}
		
		local NewTabFrame = Instance.new("Frame")
		local InnerTabFrame = Instance.new("Frame")
		local TabTitle = Instance.new("TextButton")
		local NewPage = Instance.new("Frame")
		local PageBorder = Instance.new("Frame")
		local PageContent = Instance.new("Frame")
		local ScriptTitle = Instance.new("Frame")
		local ContentScrollingFrame = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")

		NewTabFrame.Name = "NewTabFrame"
		NewTabFrame.Parent = TabsScrollingFrame
		NewTabFrame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		NewTabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NewTabFrame.BorderSizePixel = 0
		NewTabFrame.Size = UDim2.new(1, -10, 0, 21)

		InnerTabFrame.Name = "InnerTabFrame"
		InnerTabFrame.Parent = NewTabFrame
		InnerTabFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		InnerTabFrame.BackgroundColor3 = Color3.fromRGB(24, 25, 24)
		InnerTabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		InnerTabFrame.BorderSizePixel = 0
		InnerTabFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		InnerTabFrame.Size = UDim2.new(1, -2, 1, -2)

		TabTitle.Name = "TabTitle"
		TabTitle.Parent = InnerTabFrame
		TabTitle.AnchorPoint = Vector2.new(0.5, 0.5)
		TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabTitle.BackgroundTransparency = 1.000
		TabTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabTitle.BorderSizePixel = 0
		TabTitle.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabTitle.Size = UDim2.new(1, 0, 0, 20)
		TabTitle.Font = Enum.Font.RobotoMono
		TabTitle.Text = name
		TabTitle.TextColor3 = Color3.fromRGB(194, 194, 194)
		TabTitle.TextSize = 13.000

		NewPage.Name = "page_" .. tostring(settings.PRIVATE_Pages)
		NewPage.Parent = InsideContent
		NewPage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		NewPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NewPage.BorderSizePixel = 0
		NewPage.Position = UDim2.new(0, 163, 0, 17)
		NewPage.Size = UDim2.new(1, -167, 1, -24)
		NewPage.Visible = false

		PageBorder.Name = "PageBorder"
		PageBorder.Parent = NewPage
		PageBorder.AnchorPoint = Vector2.new(0.5, 0.5)
		PageBorder.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
		PageBorder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PageBorder.BorderSizePixel = 0
		PageBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
		PageBorder.Size = UDim2.new(1, -2, 1, -2)

		PageContent.Name = "PageContent"
		PageContent.Parent = PageBorder
		PageContent.AnchorPoint = Vector2.new(0.5, 0.5)
		PageContent.BackgroundColor3 = Color3.fromRGB(23, 26, 23)
		PageContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PageContent.BorderSizePixel = 0
		PageContent.Position = UDim2.new(0.5, 0, 0.5, 0)
		PageContent.Size = UDim2.new(1, -2, 1, -2)

		ScriptTitle.Name = "ScriptTitle"
		ScriptTitle.Parent = PageContent
		ScriptTitle.BackgroundColor3 = Color3.fromRGB(29, 30, 29)
		ScriptTitle.BorderSizePixel = 0
		ScriptTitle.Position = UDim2.new(0, 5, 0, -10)
		ScriptTitle.BackgroundTransparency = 1
		
		local ScriptTitleBottom = Instance.new("Frame", ScriptTitle)
		ScriptTitleBottom.AnchorPoint = Vector2.new(0, 1)
		ScriptTitleBottom.Position = UDim2.fromScale(0, 1)
		ScriptTitleBottom.BackgroundColor3 = PageContent.BackgroundColor3
		ScriptTitleBottom.Size = UDim2.new(1, 0, 0, 5)
		ScriptTitleBottom.BorderSizePixel = 0
		
		local ScriptTitleTop = Instance.new("Frame", ScriptTitle)
		ScriptTitleTop.BackgroundColor3 = InsideContent.BackgroundColor3
		ScriptTitleTop.Size = UDim2.new(1, 0, 0, 10)
		ScriptTitleTop.BorderSizePixel = 0
		
		local ScriptTitle2 = Instance.new("TextLabel")
		ScriptTitle2.Name = "ScriptTitle"
		ScriptTitle2.Parent = ScriptTitle
		ScriptTitle2.BackgroundColor3 = Color3.fromRGB(29, 30, 29)
		ScriptTitle2.Font = Enum.Font.RobotoMono
		ScriptTitle2.Text = name
		ScriptTitle2.TextColor3 = Color3.fromRGB(19, 255, 106)
		ScriptTitle2.TextSize = 14.000
		ScriptTitle2.BackgroundTransparency = 1
		ScriptTitle2.Size = UDim2.fromScale(1, 1)
		
		ContentScrollingFrame.Name = "ContentScrollingFrame"
		ContentScrollingFrame.Parent = PageContent
		ContentScrollingFrame.Active = false
		ContentScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContentScrollingFrame.BackgroundTransparency = 1.000
		ContentScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContentScrollingFrame.BorderSizePixel = 0
		ContentScrollingFrame.Position = UDim2.new(0, 8, 0, 13)
		ContentScrollingFrame.Size = UDim2.new(1, -16, 1, -20)
		ContentScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		ContentScrollingFrame.ScrollBarThickness = 0

		UIListLayout.Parent = ContentScrollingFrame
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 3)
		
		NewTabFrame:SetAttribute("isSelected", false) -- attriburtes in a ui library 😭
		NewTabFrame:SetAttribute("tabId", NewPage.Name)
		
		TabTitle.MouseButton1Click:Connect(function()
			NewTabFrame.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
			InnerTabFrame.BackgroundColor3 = Color3.fromRGB(35, 36, 35)
			NewTabFrame:SetAttribute("isSelected", true)
			NewPage.Visible = true
			for i, frame in pairs(TabsScrollingFrame:GetChildren()) do
				if frame.Name == tostring(NewTabFrame) and frame ~= NewTabFrame then
					frame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
					frame.InnerTabFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					frame:SetAttribute("isSelected", false)
					InsideContent[frame:GetAttribute("tabId")].Visible = false
					frame.InnerTabFrame.TabTitle.TextColor3 = Color3.fromRGB(194, 194, 194)
				end
			end
		end)
		
		colorUpdate.Event:Connect(function(hsv)
			ScriptTitle2.TextColor3 = hsv
			ScriptTitle.Size = UDim2.new(0, ScriptTitle2.TextBounds.X, 0, 15)
			if NewTabFrame:GetAttribute("isSelected") then
				TabTitle.TextColor3 = hsv
			end
		end)
		
		NewTabFrame.MouseEnter:Connect(function()
			if NewTabFrame:GetAttribute("isSelected") then return end
			InnerTabFrame.BackgroundColor3 = Color3.fromRGB(29, 30, 29)
		end)
		
		NewTabFrame.MouseLeave:Connect(function()
			if NewTabFrame:GetAttribute("isSelected") then return end
			InnerTabFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		end)
		
		function tabData.Section(name)
			local elements = {}
			
			local SectionBorder = Instance.new("Frame")
			local SectionInner = Instance.new("Frame")
			local ImageLabel = Instance.new("ImageButton")
			local TextLabel = Instance.new("TextButton")

			SectionBorder.Name = "SectionBorder"
			SectionBorder.Parent = ContentScrollingFrame
			SectionBorder.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
			SectionBorder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionBorder.BorderSizePixel = 0
			SectionBorder.ClipsDescendants = true
			SectionBorder.Size = UDim2.new(1, 0, 0, 20)

			SectionInner.Name = "SectionInner"
			SectionInner.Parent = SectionBorder
			SectionInner.AnchorPoint = Vector2.new(0.5, 0.5)
			SectionInner.BackgroundColor3 = Color3.fromRGB(30, 31, 30)
			SectionInner.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionInner.BorderSizePixel = 0
			SectionInner.ClipsDescendants = true
			SectionInner.Position = UDim2.new(0.5, 0, 0.5, 0)
			SectionInner.Size = UDim2.new(1, -2, 0, 18)

			ImageLabel.Parent = SectionBorder
			ImageLabel.AnchorPoint = Vector2.new(1, 0)
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(1, -7, 0, 3)
			ImageLabel.Size = UDim2.new(0, 16, 0, 16)
			ImageLabel.Image = "rbxassetid://107971420116311"
			ImageLabel.ImageColor3 = Color3.fromRGB(212, 212, 212)

			TextLabel.Parent = SectionBorder
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 6, 0, 1)
			TextLabel.Size = UDim2.new(1, 0, 0, 18)
			TextLabel.Font = Enum.Font.RobotoMono
			TextLabel.Text = name
			TextLabel.TextColor3 = Color3.fromRGB(212, 212, 212)
			TextLabel.TextSize = 13.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			
			local sectionData = {}
			
			local position = 20
			local sz1, sz2
			
			local isCollapsed = true
			TextLabel.MouseButton1Click:Connect(function()
				isCollapsed = not isCollapsed
				if isCollapsed then
					for i, v in pairs(elements) do
						if v:IsA("GuiObject") then
							v.Visible = false
						end
					end
					SectionBorder.Size = UDim2.new(1, 0, 0, 20)
					SectionInner.Size = UDim2.new(1, -2, 0, 18)
				else
					for i, v in pairs(elements) do
						if v:IsA("GuiObject") then
							v.Visible = true
						end
					end
					SectionBorder.Size = sz2
					SectionInner.Size = sz1
					
				end
			end)
			
			TextLabel.MouseButton1Click:Once(function()
				for i, v in pairs(elements) do
					sectionData:_update(v)
				end
			end)
			
			function sectionData:_update(v)
				local size = SectionInner.Size
				SectionInner.Size = UDim2.new(size.X.Scale, size.X.Offset, size.Y.Scale, SectionInner.AbsoluteSize.Y + v.AbsoluteSize.Y + 3)
				SectionBorder.Size = UDim2.new(1, 0, 0, SectionInner.AbsoluteSize.Y + 2)
				position = position + v.AbsoluteSize.Y + 3
				sz1, sz2 = SectionInner.Size, SectionBorder.Size
				v.Position = UDim2.new(0, 3, 0, (position - v.AbsoluteSize.Y) - 4)
			end
			
			function sectionData.Button(name, callback)
				local Button = Instance.new("Frame")
				local Frame = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local TextLabel = Instance.new("TextButton")

				Button.Name = "Button"
				Button.Parent = SectionInner
				Button.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(0, 200, 0, 20)
				Button.Visible = false

				Frame.Parent = Button
				Frame.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
				Frame.Size = UDim2.new(1, -2, 1, -2)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 31, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 27 ,26))}
				UIGradient.Rotation = 90
				UIGradient.Parent = Frame

				TextLabel.Parent = Frame
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Size = UDim2.new(1, 0, 1, 0)
				TextLabel.Font = Enum.Font.RobotoMono
				TextLabel.Text = name
				TextLabel.TextColor3 = Color3.fromRGB(176, 176, 176)
				TextLabel.TextSize = 14.000
				TextLabel.MouseButton1Click:Connect(callback)
				
				TextLabel.MouseEnter:Connect(function()
					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(41, 43, 41)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 38, 38))}
				end)
				TextLabel.MouseLeave:Connect(function()
					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 31, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 27 ,26))}
				end)
				
				table.insert(elements, Button)
			end
			
			function sectionData.Slider(name, def, min, max, callback)
				local Slider = Instance.new("Frame")
				local Frame = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local TextLabel = Instance.new("TextLabel")
				local Frame_2 = Instance.new("Frame")
				local UIGradient_2 = Instance.new("UIGradient")
				local TextButton = Instance.new("TextButton")

				Slider.Name = "Slider"
				Slider.Parent = SectionInner
				Slider.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 3, 0, 87)
				Slider.Size = UDim2.new(0, 200, 0, 20)
				Slider.Visible = false
				
				Frame.Parent = Slider
				Frame.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
				Frame.Size = UDim2.new(1, -2, 1, -2)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(51, 53, 51)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(41, 43, 41))}
				UIGradient.Rotation = 90
				UIGradient.Parent = Frame

				TextLabel.Parent = Frame
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Size = UDim2.new(1, 0, 1, 0)
				TextLabel.Font = Enum.Font.RobotoMono
				TextLabel.Text = name .. " " .. def .. "/" .. max
				TextLabel.TextColor3 = Color3.fromRGB(176, 176, 176)
				TextLabel.TextStrokeTransparency = 0
				TextLabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
				TextLabel.TextSize = 14.000
				TextLabel.ZIndex = 2

				Frame_2.Parent = Frame
				Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame_2.BorderSizePixel = 0
				Frame_2.Size = UDim2.new((def - min) / (max - min), 0, 1, 0)

				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0,0,0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0,0,0))}
				UIGradient_2.Rotation = 90
				UIGradient_2.Parent = Frame_2

				TextButton.Parent = Frame
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.BorderSizePixel = 0
				TextButton.Size = UDim2.new(1, 0, 1, 0)
				TextButton.Font = Enum.Font.SourceSans
				TextButton.Text = ""
				TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.TextSize = 14.000
				TextButton.ZIndex = 3
				
				colorUpdate.Event:Connect(function(_, hue)
					UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromHSV(hue, 1, 1)), ColorSequenceKeypoint.new(1.00, Color3.fromHSV(hue, 1, 0.6))}
					--UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromHSV(hue, 1, 0.4)), ColorSequenceKeypoint.new(1.00, Color3.fromHSV(hue, 1, 0.3))}
				end)
				
				local Dragging = false
				local Last
				local Ya = nil
				TextButton.MouseButton1Down:Connect(function(Key)
					Dragging = true
					Ya = game:GetService("RunService").RenderStepped:Connect(function()
						local Percent = math.clamp((game:GetService("Players").LocalPlayer:GetMouse().X - Frame.AbsolutePosition.X) / Frame.AbsoluteSize.X, 0, 1)
						local Value = min + (Percent*(max-min))
						Frame_2.Size = UDim2.fromScale(Percent, 1)
						if math.floor(Value) ~= Last then
							TextLabel.Text =  name .. " " .. math.floor(Value) .. "/" .. max
							Last = math.floor(Value);
							(callback or function() end)(math.floor(Value))
						end
						wait()
					end)
					--end
				end)
				game:GetService("UserInputService").InputEnded:Connect(function(Key)
					if Dragging and Key.UserInputType == Enum.UserInputType.MouseButton1 or Key.UserInputType == Enum.UserInputType.Touch then
						if Ya then Ya:Disconnect() end
						Dragging = false
					end
				end)
				
				table.insert(elements, Slider)
			end
			
			function sectionData.Toggle(name, callback, default)
				local Toggle = Instance.new("Frame")
				local Frame = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local Frame_2 = Instance.new("Frame")
				local UIGradient_2 = Instance.new("UIGradient")
				local TextLabel = Instance.new("TextButton")

				Toggle.Name = "Toggle"
				Toggle.Parent = SectionInner
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 1.000
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0, 3, 0, 57)
				Toggle.Size = UDim2.new(0, 200, 0, 20)
				Toggle.Visible = false

				Frame.Parent = Toggle
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Size = UDim2.new(0, 16, 0, 16)
				Frame.AnchorPoint = Vector2.new(0, 0.5)
				Frame.Position = UDim2.fromScale(0, 0.5)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(50, 51, 50)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(45, 47, 47))}
				UIGradient.Rotation = 90
				UIGradient.Parent = Frame

				Frame_2.Parent = Frame
				Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
				Frame_2.Size = UDim2.new(1, -2, 1, -2)

				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(34, 33, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(45, 47, 47))}
				UIGradient_2.Rotation = 270
				UIGradient_2.Parent = Frame_2

				TextLabel.Parent = Toggle
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0, 22, 0, 0)
				TextLabel.Size = UDim2.new(1, 0, 1, -4)
				TextLabel.Font = Enum.Font.RobotoMono
				TextLabel.Text = name
				TextLabel.TextColor3 = Color3.fromRGB(176, 176, 176)
				TextLabel.TextSize = 14.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				
				local isToggled
				local function click()
					(function()
						isToggled = not isToggled
						callback(isToggled)
					end)()
				end
				local clickbox = Instance.new("TextButton", Toggle)
				clickbox.Size = UDim2.fromScale(1, 1)
				clickbox.Text = ""
				clickbox.BackgroundTransparency = 1
				clickbox.MouseButton1Click:Connect(click)
				
				colorUpdate.Event:Connect(function(_, hue)
					if isToggled then
						UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromHSV(hue, 1, 1)), ColorSequenceKeypoint.new(1.00, Color3.fromHSV(hue, 1, 0.6))}
						UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromHSV(hue, 1, 0.4)), ColorSequenceKeypoint.new(1.00, Color3.fromHSV(hue, 1, 0.3))}
					else
						UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(50, 51, 50)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(45, 47, 47))}
						UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(34, 33, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(45, 47, 47))}
					end
				end)
				if default == true then
					click()
				end
				
				table.insert(elements, Toggle)
			end
			
			return sectionData
		end
		
		return tabData
	end
	
	return windowData
end


return lib
