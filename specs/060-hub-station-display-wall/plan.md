# Wall closure and centered Pix

User directly requested closing the opening beneath the viewer-left two TVs and moving Pix to the wall center, slightly forward, facing the player. User then said "Go" and Supervisor relayed clarification that the navigation-menu pointer must move with Pix. This plan synchronizes the existing guide, Talk interaction and automatic invitation center; no new navigation system.

## Exact delta

Authored closure-pix-delta.json emits scene-delta.json. Its desired_feature_actors_for_verification_only is a55-actor inventory, not a spawn list. Only two feature meshes change:

- hub060_left_wall: extend maxX -980 to -480; keep minX -1680,Y2335..2370,Z2400..2642. Center(-1080,2352.5,2521),scale(12,0.35,2.42),cream,BlockAll.
- hub060_left_plinth: extend maxX -480; minX -1680,Y2332..2372,Z2400..2420. Center(-1080,2352,2410),scale(12,0.4,0.2),navy,NoCollision. Retain rightpier/rightplinth at their measuredZ2412 floor. Fill atfloorZ2400 embeds12cm whereopeningflooris2412,leavingnofloatinggap. Final55meshes:3BlockAll/52NoCollision.
- pix_hub_helper_figure: from(-100,2575,2412),yaw180 to(-1050,2050,2400),yaw90,pitch/roll0,scale1. Eye/smile local-X provesfacepointsworld-Y afteryaw90. Preserve15componentidentities/localpositions/scales/materials/collision exceptthePIXlabelrotation. Groundcenter/corners surveyedZ2400. Root285cm infrontofwallfrontY2335;conservative128cmhalfboundleaves157cmgap.
- pix_name_label existingTextRender: relativeyaw195 to180;preserveallotherrelativefields/text/material. Rootyaw90+relative180 yieldsworld270(-Y). Resolveactualcomponentref andreadbackfirst;verifyface/PIXlabelincookedview.
- pix_travel_talk: from(-100,2500,2500) to(-1050,1975,2488),retainyaw180,scale1,options/bindings. Existingnavigationinteraction/pointerstays75cm infrontofPix,88cm aboveground. Retain1.5interactionradius,0hold,hiddenmesh,TalktoPixtext. Do notrotatetheoffsetsideways.

Travelcontrolleractor/destinations/TVs/lights remainunchanged. Nonew/deletedactors. FullcanonicalTVtitles,nativetextfit/fallbacks andjournalheartbeat remainunchanged.

## Navigation synchronization and route

Existing pix_travel.near() center(-100,2450) becomes(-1050,1925):dx=position.X+1050.0;dy=position.Y-1925.0. Preserveverticalbounds2350..2650,125cm approach/200cm rearm,existingowner/UI/spawn/return/menu/teleport/rewardsemantics. Updateoldfloorcommentto2400 ifneeded. TalkbuttonandautomaticinvitationmustbothworkatnewPix,andnotremainatoldsite. No other missionpointermovesareinferred.

Closingtheopening removesdirectwalkthrough. ExistingfoundationandeastsidefloorsurveyZ2412 plusclearX-350 rayY2200..2600 supportaneastdetouraroundwallendX-420. Capsule/cornertraversalstillrequired:walkslightlyfarthereastontheexistingfoundationifnecessary,thenjoinoriginalrearwalkway. No newfloor/ramporwallredesign. MovingoldTalkremovesitsoldX-100obstruction.

## Verification

Evidence: evidence/pix-closure-readonly-survey.md. Checkpointactors/components/source,recheckreadiness anduniqueidentities,applyserializedupdates,readback55meshes/15Pixcomponents/fullTVtitles/bindings. Save,BuildVerse,validate/cook. Verifyclosedwall,groundedfrontfacingPixandlabel,alignednavigationpointer/Talk/automaticapproach,decline/rearm/travel,spawn/returnandeastdetourbothdirections,status/journal/rewards. IndependentQA;stopgame/sessionandverify nonrunning,editoropen. No gameplay acceptance is claimed by planning.
