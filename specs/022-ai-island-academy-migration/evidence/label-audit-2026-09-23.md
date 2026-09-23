# Label audit — 2026-09-23

## Scope and method

Read-only inspection of the loaded `/fn_shoreline_island/fn_shoreline_island`
UEFN level and current Verse sources. The accompanying
[inventory](label-inventory-2026-09-23.csv) lists 552 placed Billboard texts,
41 explicitly configured Button interaction prompts, one nonempty Tracker
description, and 469 Verse `<localizes>:message` declarations (1,063 rows).
There are 34 HUD Message devices with no saved message; Verse supplies their
runtime text. Another 288 Buttons use the generic saved `Interact` prompt.

The audit resolved all 252 Billboard references exposed by 44 placed Verse
devices to their saved actors. The other 300 Billboards have no such Verse
reference and retain their saved text unless another mechanism changes them.
The inventory records saved editor text and source declarations. It does not
prove what a client renders after Verse starts, line wrapping, or visibility.

## Confirmed stale static world labels

- Three unbound route/start signs still use former zone names:
  `debug_station_1_route` says **DEBUG WORKSHOP**,
  `event_station_1_route` says **EVENT FACTORY**, and
  `signal_2_start_here_sign` says **SIGNAL LIGHTHOUSE**.
- Eight unbound Confidence Core control Billboards, `energy_0_label_add` /
  `subtract` and their Station 2–4 copies, still say **+1 ENERGY** /
  **-1 ENERGY**. The Verse interaction text and board present these controls
  as **+10% / -10% confidence**.
- At the four AI Classifier stations, 24 unbound dock/control labels still say
  **GARDEN**, **WORKSHOP**, and **STORAGE** (two labels for each destination per
  station). The Verse button prompts and lesson classify Apple, Puppy, and Car
  as **Food**, **Animal**, and **Vehicle**. The unbound
  `signal_2_how_to_play_sign` also still instructs players to read a
  **cargo label** and use a **matching dock**.
- Four Fix the Prompt stations have 16 unbound stage labels reading
  **1 WATERED**, **2 PLANTED**, **3 GROWN**, and **4 HARVESTED**. The migrated
  Verse instructions instead teach **Find Seed, Dig Hole, Plant Seed, Water**.

## Other labels requiring review

- Four AI Error Lab static result labels still say **GARDEN** and four say
  **STORAGE**. These may describe physical destinations, but they do not yet
  read as part of the new AI Error Lab presentation.
- 36 Billboards still store old zone names in their editor `text` property.
  They are all bound to Verse devices whose source declares migrated text, so
  they are intended to be rewritten when Verse initializes. The saved editor
  defaults remain old. One Confidence Badge Tracker also stores an old
  Variable Vault description, while its Verse progress device sets a new
  description at runtime.
- Four Prompt Lab Button devices store the old interaction prompts **Water**,
  **Plant**, **Wait**, and **Harvest**. The Verse manager sets the new
  **Find Seed**, **Dig Hole**, **Plant Seed**, and **Water** prompts on start.

## Source terminology result

A case-insensitive search of all project Verse files found former complete zone
and badge names only in one internal comment about Variable Vault fixtures.
The `<localizes>:message` declarations therefore have no detected former
complete zone or badge name. This is a source-text check, not a gameplay or
visual confirmation.

## Conclusion

The player-facing label migration is incomplete in the saved level. The three
old route/start names and the classifier, confidence, and repair labels above
are static Billboards, so a Verse text refresh cannot correct them. Review
their intended wording and update them through UEFN, then repeat the editor
read-back and in-client checks.
