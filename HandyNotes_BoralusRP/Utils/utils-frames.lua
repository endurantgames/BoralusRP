
local myname, ns = ...

if not ns.utils       then ns.utils       = {} end;
if not ns.utils.frame then ns.utils.frame = {} end;

local AceGUI = LibStub("AceGUI-3.0");
local C = ns.CONST;

local function inviteFrame(inv)

  local invite = AceGUI:Create("Window");
  invite:SetTitle(C.LINK[inv .. "_Label"]);
  invite:SetWidth(250);
  invite:SetHeight(250);

  invite:EnableResize(false);
  invite:SetCallback("OnClose", function(w) AceGUI:Release(w) end);
  invite:SetLayout("List");

  if C.LINK[inv .. "_Code"] 
     then

       local codeForInvite = AceGUI:Create("EditBox");
       if inv == "Discord" then codeForInvite:SetLabel("Discord Invite Code");
                           else codeForInvite:SetLabel("Community Invite Code");
                           end;
       codeForInvite:SetWidth(200);
       codeForInvite:SetText(C.LINK[inv .. "_Code"]);
       codeForInvite:DisableButton(true);
       codeForInvite.editbox:SetScript("OnEditFocusGained", function() codeForInvite:HighlightText() end);
       codeForInvite.editbox:SetScript("OnEscapePressed", function() invite:Release() end);
       invite:AddChild(codeForInvite);
     end;

  if C.LINK[inv]
     then

       local cityLink = AceGUI:Create("EditBox");
       cityLink:SetLabel("Boralus.City Address");
       cityLink:SetWidth(200);
       cityLink:SetText(C.LINK.City_Prefix .. C.LINK[inv]);
       cityLink:DisableButton(true);
       cityLink.editbox:SetScript("OnEditFocusGained", function() cityLink:HighlightText() end);
       cityLink.editbox:SetScript("OnEscapePressed", function() invite:Release() end);
       invite:AddChild(cityLink);
     end;

  if C.LINK[inv .. "_URL"]
    then
      local directUrl = AceGUI:Create("EditBox");
      directUrl:SetLabel("Direct Web URL");
      directUrl:SetWidth(200);
      directUrl:SetText(C.LINK[inv .. "_URL"]);
      directUrl:DisableButton(true);
      directUrl.editbox:SetScript("OnEditFocusGained", function() directUrl:HighlightText() end);
      directUrl.editbox:SetScript("OnEscapePressed", function() invite:Release() end);
      invite:AddChild(directUrl);
    end;

       
  local instructions = AceGUI:Create("Label");
  if C.LINK[inv .. "_Code"] and (C.LINK[inv] or C.LINK[inv .. "_URL"]) 
     then instructions:SetText(C.LINK.instruct_both);
     elseif C.LINK[inv .. "_URL"] or C.LINK[inv]
     then instructions:SetText(C.LINK.instruct_url);
     elseif C.LINK[inv .. "_Code"] 
     then instructions:SetText(C.LINK.instruct_code);
     else instructions:SetText(C.LINK.instruct_both);
     end;
  instructions:SetWidth(225);
  invite:AddChild(instructions);

end;

ns.utils.frame.invite = inviteFrame;
