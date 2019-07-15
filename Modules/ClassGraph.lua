local _, core = ...;
local _G = _G;
local MonDKP = core.MonDKP;


function MonDKP:ClassGraph()
	local graph = CreateFrame("Frame", "MonDKPClassIcons", MonDKP.ConfigTab1)

	graph:SetPoint("TOPLEFT", MonDKP.ConfigTab1, "TOPLEFT", 0, 0)
	graph:SetBackdropColor(0,0,0,0)
	graph:SetSize(460, 495)

	local icons = {}
	graph.icons = icons;
	local c = MonDKP:GetCColors();
	local classCount = {}
	local perc_height = {}
	local perc = {}
	local BarMaxHeight = 400
	local BarWidth = 25

	for k, v in pairs(core.classes) do
		local classSearch = MonDKP:Table_Search(MonDKP_DKPTable, v)
		tinsert(classCount, #classSearch)
		local classPerc = round(#classSearch / #MonDKP_DKPTable, 4);
		tinsert(perc, classPerc * 100)
		local adjustBar = BarMaxHeight * classPerc;
		tinsert(perc_height, adjustBar)
	end

	for i=1, 8 do
		graph.icons[i] = graph:CreateTexture(nil, "OVERLAY", nil);   -- Title Bar Texture
		if i==1 then
	  		graph.icons[i]:SetPoint("BOTTOMLEFT", graph, "BOTTOMLEFT", 74, 40);
		else
			graph.icons[i]:SetPoint("LEFT", graph.icons[i-1], "RIGHT", 15, 0);
		end
  		graph.icons[i]:SetColorTexture(0, 0, 0, 1)
  		graph.icons[i]:SetSize(28, 28);
  		graph.icons[i].bar = CreateFrame("Frame", "MonDKP"..i.."Graph", graph)
		graph.icons[i].bar:SetPoint("BOTTOM", icons[i], "TOP", 0, 5)
		graph.icons[i].bar:SetBackdropBorderColor(1,1,1,0)
  		graph.icons[i].bar:SetSize(BarWidth, perc_height[i])
  		graph.icons[i].bar:SetBackdrop({
			bgFile   = "Interface\\AddOns\\MonolithDKP\\Media\\Textures\\graph-bar", tile = false,
		});
  		graph.icons[i]:SetTexture("Interface\\GLUES\\CHARACTERCREATE\\UI-CharacterCreate-Classes");

  		local c = MonDKP:GetCColors(core.classes[i])
		graph.icons[i].bar:SetBackdropColor(c.r, c.g, c.b, 1)

		graph.icons[i].percentage = graph.icons[i].bar:CreateFontString(nil, "OVERLAY")
		graph.icons[i].percentage:SetPoint("BOTTOM", graph.icons[i].bar, "TOP", 0, 3)
		graph.icons[i].percentage:SetFontObject("MonDKPSmallCenter")
		graph.icons[i].percentage:SetText(round(perc[i], 1).."%")
		graph.icons[i].percentage:SetTextColor(1, 1, 1, 1)

		graph.icons[i].count = graph.icons[i].bar:CreateFontString(nil, "OVERLAY")
		graph.icons[i].count:SetPoint("BOTTOM", graph.icons[i].bar, "BOTTOM", 0, -55)
		graph.icons[i].count:SetFontObject("MonDKPSmallCenter")
		graph.icons[i].count:SetText(classCount[i])
		graph.icons[i].count:SetTextColor(1, 1, 1, 1)

		--MonDKP.ConfigTab2.header:SetScale(1.2)
	end

	--druid
	graph.icons[1]:SetTexCoord(0.740, 0.9921, 0.005, 0.247)
	--hunter
	graph.icons[2]:SetTexCoord(0, 0.25, 0.2549, 0.5019)
	--mage
	graph.icons[3]:SetTexCoord(0.25, 0.494, 0, 0.25)
	--priest
	graph.icons[4]:SetTexCoord(0.5, 0.75, 0.25, 0.5)
	--rogue
	graph.icons[5]:SetTexCoord(0.5, 0.74, 0, 0.25)
	--shaman
	graph.icons[6]:SetTexCoord(0.25, 0.5, 0.25, 0.5)
	--warlock
	graph.icons[7]:SetTexCoord(0.74, 1, 0.25, 0.5)
	--warrior
	graph.icons[8]:SetTexCoord(0, 0.25, 0, 0.255)
	
	--tex:SetTexCoord(left, right, top, bottom)

	return graph;
end