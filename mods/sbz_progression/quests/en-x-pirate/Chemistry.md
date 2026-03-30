
# Questline: Chemistry


## Crusher
### ID: qid_crusher

### Text

Ye can toss in pebbles t'plunder metals from 'em, it'll also crush stones into 2 gravel each, and gravel into 2 sand each, arrr!

### Meta

Requires: qid_concrete_plan, qid_antimatter, qid_charged_field

## Secret: It's fake
### ID: qid_its_fake

### Text

Digital gold, ye say? Where have I heard that tale before, I wonder...

### Meta

Requires: 

## Furnace
### ID: qid_furnace

### Text

The High Power Electric Furnace (H.P.E.F fer short), allows ye to smelt any powder into an ingot, and ingots be heavily used in craftin' recipes, they are. Ye may need to rig up another generator to power the blasted thing.

### Meta

Requires: qid_crusher

## Simple Alloy Furnace
### ID: qid_simple_alloy_furnace

### Text

Smelts metals into alloys, it does!
Try out some combinations of metals to see which ones create alloys. Consumes 10 Power when runnin', so keep yer eyes peeled!

### Meta

Requires: qid_crusher, qid_emittrium_circuits, qid_antimatter, qid_charged_field

## Bronze Age
### ID: qid_bronze_age

### Text

Hoist the colors, Commander! Ye've just unlocked the Bronze Age, because nothin' says 'cuttin'-edge space exploration' like struggling to make a metal our ancestors figured out 5,000 years ago, arrr! Sure, ye've mastered faster-than-light travel, but apparently mixin' `[REDACTED]` and `[REDACTED]` is still rocket science. Good luck, Space Caveman!

### Meta

Requires: qid_simple_alloy_furnace, qid_crusher

## Centrifuge
### ID: qid_centrifuge

### Text

In the centrifuge ye can pillage:
- sand -> silicon, gold, white sand
- gravel -> titanium, lithium, cobalt, pebbles
- white sand/dark sand -> silver, darker variation of said sand

### Meta

Requires: qid_crusher, qid_simple_alloy_furnace

## Compressor
### ID: qid_compressor

### Text

Have ye ever wanted to turn yer metals into blocks, matey? Now ye can, arrr!
Craft this wonderful compressor, shove in 9 powder, or 9 ingots, and watch as it makes blocks out of 'em, just like magic!

Blocks made from metals cannot be dug with Matter Annihilators, ye must use the robotic arm or the drill instead, or face Davy Jones' locker!

### Meta

Requires: qid_crusher, qid_simple_alloy_furnace


## Advanced Batteries
### ID: qid_advanced_batteries

### Text

A battery forged with metals, fit fer a proper pirate! Significantly better than that measly basic battery, it is.

### Meta

Requires: qid_batteries, qid_furnace, qid_centrifuge

## Very Advanced Batteries
### ID: qid_very_advanced_batteries

### Text

If ye have **lots of metals** this be the battery fer ye, arrr! If ye don't, then those metals be better put to other plunder.

### Meta

Requires: qid_batteries, qid_furnace, qid_advanced_batteries

## Crystal Grower
### ID: qid_crystal_grower

### Text

Grows crystals out of stuff, like some kind of sorcery of the deep!

### Meta

Requires: qid_compressor, qid_neutronium

## Teleport Battery
### ID: qid_teleport_battery

### Text

The Teleport Battery teleports power across networks, it does! Can be mighty useful when ye be tryin' to share power with other scallywags.

### Meta

Requires: qid_crystal_grower

## Jetpack
### ID: qid_jetpack

### Text

Have ye wished to fly through the skies like a seabird, matey? Do I have the tool fer ye, arrr...

The controls, so ye don't go overboard:

Left clickin' while holdin' an un-activated jetpack (ye can see with the red light on the texture) will activate it.
Left clickin' while holdin' an activated jetpack (the light becomes green) will de-activate it

When a jetpack is activated:
If ye press/hold jump:
- jetpack applies upwards velocity to ye
- jetpack wears down a bit
- ye become 2x faster
If ye press/hold both jump and shift or aux1:
- jetpack applies half as much upwards velocity as when ye jump
- jetpack wears down 2x less
- ye still become 2x faster

The mode ye be flyin' in can also be seen by how many particles be gettin' spawned, so keep yer eyes peeled!
The wear be set up such that it lasts ye 3 minutes of constant flyin', so don't be squanderin' it!

Ye can re-fuel yer jetpack by right-clickin' on a battery, a full recharge costs 20 kCj, arr.

The jetpack gets de-activated when ye move it in yer inventory durin' flight, or when it runs out of charge, so be wary!

The Jetpack used to get automatically de-activated when ye stopped havin' it in yer hand, but those days be gone now, savvy?

### Meta

Requires: qid_neutronium

## Bear Arms
### ID: qid_bear_arms

### Text

Notice the small little pun there, do ye? .. It be tellin' ye plain as the sea to craft a Robotic Arm! Oh.

### Meta

Requires: qid_furnace

## Electric Drill
### ID: qid_electric_drill

### Text

The electric drill has 500 uses and be powered by electricity, it is!

If ye right click on a battery with the electric drill in yer hand, it will take power from the battery and charge the drill, just like the jetpack, arrr!
It needs 1 power per 1 use, so don't be wastin' it.

It also digs 2x faster than the robotic arm, which is mighty fine fer a pirate in a hurry!

### Meta

Requires: qid_bear_arms

## Antimatter Generators
### ID: qid_antimatter_generators

### Text

Craft the antimatter generator, matey! It be best used with automation or a large array of batteries, arrr.
It needs 1 matter and 1 antimatter per second, so it be a greedy beast!
It be super resource hungry but gives ye more power in return, which makes fer fine plunder!

### Meta

Requires: qid_furnace

## Engraver
### ID: qid_engraver

### Text

Creates processors from silicon crystals, as if carvin' the secrets of the deep into stone!

### Meta

Requires: qid_laser, qid_crystal_grower

## Info: Multiblock Terminology
### ID: qid_info_multiblock_terminology

### Text

Multiblock - A machine that be made from multiple nodes (blocks), like a proper fleet of ships!
Wallsharing - When 2 multiblocks share a wall, like two ships lashed together.
"Forming" a multiblock - Connectin' all the nodes of a multiblock to a controller, bringin' the fleet together!
"Breaking" a multiblock - Disconnectin' all the nodes of a multiblock, makin' it not function, arrr. This does **not** mean that any of the nodes of the multiblock would be damaged, the multiblock just won't function and will have to be re-formed, like a crew that's been scattered!

Multiblocks will break when they be moved, or if any of their nodes be broken. This means they ain't friendly to jumpdrives and ye will have to form them again, which may change in the future, savvy?
The emittrium reactor was made before multiblocks got standardised, so some of this information here most likely won't apply to them, so don't be blamin' me if somethin' goes wrong!

### Meta

Requires: 

## Blast Furnace
### ID: qid_blast_furnace

### Text

The Blast Furnace be a multiblock that allows ye to smelt or alloy things very fast, fit fer the mightiest of pirates!
It also introduces a special mode that lets ye alloy 3 items (required fer some recipes), and when usin' the item input, it won't clog like the alloy furnace, which be a true treasure!

**Please keep in mind, before makin' it, have some good ore automation, or ye will find craftin' it really not fun, and may end up cursin' the seven seas.** To get started, craft the blast furnace controller.
Click/tap on the "Show Build Plan" button to see what nodes the furnace will occupy. The furnace will always face one way relative to the controller, like a proper ship facin' the wind.
Then, choose the amount of heater rows ye want. Each heater smelts as fast as a regular furnace, and it will speed up "blast recipes" (recipes that require the blast furnace).
Then build it, arrr!

Once ye have built it according to the plan, don't forget to replace one machine casing (any machine casing) with one power port, or it be as useless as a ship with no sails!
Optionally, ye can add the item inputs/outputs. The item output will completely dump the destination inventory, like plunderin' the whole hold!

The blast furnace will look like this (the amount of heaters and the placement of the power port, item input and item output can be different, just like a pirate ship can be rigged many ways):
\<img name=questbook_image_blast_furnace.png\>

To complete this quest, craft a blast furnace controller, but be aware that it doesn't end there, there be more adventure ahead!

### Meta

Requires: qid_compressor, qid_engraver

## Phlogiston Fuser
### ID: qid_phlogiston_fuser

### Text

Chemistry be borin'.... what about alchemy, arrr!
To make phlogiston, ye'll need lots of power fer a very long time, so be warned, ye landlubber!
Ye can also make some armor from phlogiston, and once it be low on durability, ye can charge that armor like ye would charge yer jetpack, savvy?

### Meta

Requires: qid_crystal_grower, qid_very_advanced_batteries

## Planet Teleporter
### ID: qid_planet_teleporter

### Text

**Right**-click with a warp crystal to use, savvy! If ye left click ye will waste it, and that be a fool's errand! There be multiple types of planets, with some of them havin' rings, like treasures waitin' to be discovered!

### Meta

Requires: qid_neutronium, qid_phlogiston_fuser

## Info: Inside of planets
### ID: qid_info_inside_of_planets

### Text

In the center of a planet, there be a core, around it be some molten metal, like the belly of a great beast!

Molten metal reacts with cold nodes (like water and ice), very slowly, it does:
- if flowin' molten metal collides with water, it gets turned into stone, arrr!
- if a flowin' metal source collides with water, it gets turned into the node that the flowin' metal was. Fer example molten silicon =\> silicon block, like magic from the deep!

There be currently no way to make molten metal, so don't be wastin' yer time tryin'!

### Meta

Requires: qid_planet_teleporter

## Planet Ores
### ID: qid_planet_ores

### Text

At the center of planets, there usually be some core material, like buried treasure!
In blue stone there be uranium ore, and blue stone be only found in ice planets, cold and treacherous!
In red stone there be thorium ore, and red stone be found in dead planets and colorium planets, bleak as a stormy sea!
To get this achievement, ye will need to put uranium or thorium powder in yer inventory, so get diggin', matey!

### Meta

Requires: qid_planet_teleporter

## Pebble Enhancer
### ID: qid_pebble_enhancer

### Text

Ye'll probably want to get thorium and uranium automatically now, no worries matey, it be possible, arrr!
Enhanced pebbles can also get ye lithium, cobalt, titanium, silicon and silver, a fine haul!
Simply put a pebble into the pebble enhancer and it will become enhanced, easy as plunderin' a merchant ship!

### Meta

Requires: qid_planet_ores

## Decay Accelerator
### ID: qid_decay_accelerator

### Text

It be used to obtain plutonium or lead from radioactive materials (Uranium, thorium, plutonium), like alchemists of the old world! Only works with powders, mind ye!

### Meta

Requires: qid_planet_ores

## Radiation Shielding
### ID: qid_radiation_shielding

### Text

Solid charged field or lead blocks shield against radiation, they do! Craft some shielding to complete this quest, lest ye glow like a cursed lantern!

### Meta

Requires: qid_planet_ores

## Nuclear Reactor
### ID: qid_nuclear_reactor

### Text

If ye need even more power, ye might want to consider nuclear reactors, the most fearsome engines on the seas!

Types of fuel rods:
- thorium: doesn't explode, 800 power — safe as a calm harbor!
- uranium: explodes if not given cooling, 2200 power — handle with care, or face the blast!
- plutonium: must have a sufficient amount **non-radioactive** water sources (not flowin' water) near the reactor, it explodes, generates 4800 power — the mightiest and most treacherous of the lot, arrr!

Ye need at least 6 fuel rods fer the reactor to power on, so gather yer resources!

### Meta

Requires: qid_planet_ores, qid_radiation_shielding

## Dust
### ID: qid_dust

### Text

Dust can grow plants at twice the speed of Dirt, but it decays after some time, like all things beneath the sun!
Ye can also climb it, and it be great fer scaffolding, handy fer any pirate engineer!

### Meta

Requires: qid_crusher

## Small Protectors
### ID: qid_small_protectors

### Text

Small protectors protect a decently sized area, like a trusty crewman standin' guard!
Unwanted scallywags won't be able to take items from machines or modify filter injectors or... like... do anything in yer land... if the area be protected. Also this can't be placed anywhere near cores, so don't even try!

Special names ("owners") that ye can add to protectors (no player can name themselves these, arrr):
**.meteorite** - meteorites will now explode in yer area
**.strange_blob_spread** - strange blobs will spread in yer area


### Meta

Requires: qid_concrete_plan, qid_furnace

## Big Protectors
### ID: qid_big_protectors

### Text

Large protectors be like the small protectors but bigger, fer when yer empire grows vast as the ocean!

### Meta

Requires: qid_small_protectors

## Node Preserver
### ID: qid_node_preserver

### Text

The node preserver preserves any node, like a sea chest keepin' yer treasure safe! Fer example:
When ye use it on a storinator, it will preserve all items in that storinator, every last piece of plunder!
Or on a luacontroller, it will preserve everything it had, not a single byte lost!
Or, with a filter injector, it will preserve... again... everything it had, arrr!

The node preservers can be used on any nodes which have metadata, or inventories, they can!
They can only dig nodes that the robotic arm can, so don't be gettin' too ambitious!

### Meta

Requires: qid_phlogiston_fuser

## Copy Tool
### ID: qid_copy_tool

### Text

(Copy Tool be a tool made with the metatool library - it also combines the luatool and tubetool from the metatool modpack, a fine piece of craftsmanship!).

The copy tool be used to copy settings between nodes, like passin' a captain's orders to the crew!

aux1+left mouse button =\> Load the configuration of the node ye be pointing at, into the tool
left mouse button =\> Paste the configuration from the tool into the node ye be pointing at, the configuration stays in the tool
Putting into crafting grid =\> resets the configuration of the copy tool
aux1+sneak+left mouse button =\> Depending on the node ye've pointed at, this may open a special menu, or do the same thing as if ye weren't sneakin', savvy?

Currently supported nodes, matey:
- autocrafter
- filter injector
- item sorter
- luacontroller
- teleport tube - brings up a special menu, arrr!
- luacontroller - copies editor code, main code, memory, formspec, and links, processes the links so that they are moved with the luacontroller

P.S. if ye find anything that ye'd like to be compatible with the copytool, don't be afraid to make a suggestion, we be friendly pirates!

### Meta

Requires: qid_tubes, qid_phlogiston_fuser

## Bulk Placer Tool
### ID: qid_bulk_placer_tool

### Text

The tool be from the "replacer" mod (specifically, SwissalpS's fork), originally called "Node replacement tool (technic)", but the name was changed in skyblock zero as that was a bit inaccurate (there be no technic here, and it can place nodes too, arrr!).

Sneak+right click =\> "Select" the node (this will be used later to decide what node to (re)place with), like choosin' yer target before the broadside!
Aux1+left click =\> Brings up a form where ye can chose how the bulk placer tool will behave. Nodes that aren't rendered as a square, or be like/rendered like glass, be treated as air.
Aux1+right click =\> Cycles through the modes without bringin' up a form, quick as a sailor in a storm!
Aux1+sneak+right click =\> Cycles between changing nodes, rotation or both
Right click =\> places the node, according to the mode
Left click =\> Replaces the node, according to the mode

It might behave weirdly with super powered lamps, so be wary of that, or ye might curse yer own ship!

### Meta

Requires: qid_phlogiston_fuser

## Firmament
### ID: qid_firmament

### Text

Firmament be a very rare drop from centrifuging dust, rarer than a mermaid's song, it is!

### Meta

Requires: qid_centrifuge, qid_dust

## Gravitational Lens
### ID: qid_gravitational_lens

### Text

Gain insight into matter by gravitational lensing, like peerin' through a mystic spyglass of the cosmos!

### Meta

Requires: qid_neutronium

## Refined Firmament
### ID: qid_refined_firmament

### Text

Ye can refine Unrefined Firmament by lookin' at it through a Gravitational Lens, arrr!

### Meta

Requires: qid_firmament, qid_blast_furnace

## Wormhole
### ID: qid_wormhole

### Text

Open far-away inventories by linkin' them to the Wormhole, like a secret passage between ships on opposite sides of the sea!

### Meta

Requires: qid_refined_firmament, qid_blast_furnace, qid_phlogiston_fuser
