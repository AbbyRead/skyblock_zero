Ahoy, quest files be harbourin' spoilers to secret quests.
Perhaps some scallywag could fashion a parser that strips away all the ### Text ### Meta plunder

# Questline: Introduction

The first questline, to introduce ye to the game. Yer adventure shall begin here.

To expand one o' these questlines, click the plus next to the name, use the arrow keys, or double-click on the questline.

## Info: General Info
### ID: qid_general_info

### Text

By holdin' `aux1` (usually the "`e`" key), ye can sprint.  
Ye have 20hp. Should ye perish, yer inventory stays with ye, so there be no reason to fret about dyin'.  

Some commands useful fer survival:
- commands of the areas mod - protectin' usin' areas with /protect has been disabled, but ye can still do other things  
- `/core` - teleports ye to the core  
- `/afk` - marks ye as afk  
- `/playtime` - shows yer, or another sailor's playtime  
- `/qb` - gives ye the questbook if ye don't have one  
- `/home` - teleports ye to home  
- `/sethome` - sets yer home  
- `/drawers_fix` - if drawers appear broken just run that, aye that command be from pandorabox_custom
- `/toggle_areas_hud` - Toggles the areas hud, useful if ye don't want to always be seein' it.  
- `/bgm_volume` \<percentage\> - sets the background music's volume  

**Hotbar switchin'** Ye can switch yer hotbar row to another one by pressin' `sneak` + `aux1` (usually `e`) + `left mouse button`, to cycle yer hotbar in the opposite direction use `sneak` + `aux1` + `right mouse button`.

**Recommended fer small screens**  
In theme settings, ye can disable "Force mono font", this'll make the font less fine but it'll make it smaller.  

**Player settings**
In yer inventory, ye can spy a settings icon at the bottom. Clickin' that takes ye to player settings.

### Meta

Requires: 

## Info: Navigating the inventory
### ID: qid_navigating_the_inventory

### Text

This game uses unified inventory. Ye may be familiar with it if ye've sailed the seas of modded minetest.  
If ye aren't familiar with it, here be some things to know:  
- Top left: categories
- Left side: A display of all the items
**If ye click on an item button, it'll first show ye what that item be used fer.**  
**If ye click on it a second time, it'll show ye how to craft that item.**
- Bottom left: Some navigation fer the left side
- Bottom right: Some miscellaneous buttons.
- Top right: The player inventory and the crafting inventory. There also be some buttons related to crafting, feel free to toy with 'em.

### Meta

Requires:

## Introduction
### ID: qid_introduction

### Text

Welcome, sailor. This be the Quest Book. Here, ye can check out what tasks ye can do and gather information about 'em.

Ye can also just ignore the Quest Book if ye be an experienced seafarer.  

Now, to get started: look down at the core. Punchin' it'll give ye some of yer first resources.  
Ye can also **hold right-click on the core**, it'll be easier on ye.  

These quests be in no particular order, but ye might need items from one quest fer another.  
The Introduction questline be designed to get ye started into a couple other questlines, so it be recommended ye jump between questlines occasionally.  

If ye need to know a recipe, search the item in the inventory, and click on it, it'll bring up what it can be used fer or how it can be crafted.  

TIP: If ye lose yer Quest Book, ye can use /qb to get it back.

### Meta

Requires: 

## A bigger platform
### ID: qid_a_bigger_platform

### Text

Isn't this one node a wee bit cramped? Let's do somethin' about that.  

Punch the Core a wee bit more. With nine 'Matter Dust', ye can craft yerself a 'Matter Blob'.  
If ye be unable to place a matter blob next to the core, try sneakin' while placin' it. On multiplayer servers the area around the core may be protected.  

### Meta

Requires: Introduction

## Antimatter
### ID: qid_antimatter

### Text

Unfortunately, ye don't seem to be strong enough to destroy that node once ye place it. That be a bit of a sorry situation, so let's craft somethin' that can. Craft some 'Antimatter Dust', we'll need it fer later.
Don't know how to craft it? The search bar in yer inventory'll help.

### Meta

Requires: Introduction

## Annihilator
### ID: qid_annihilator

### Text

Doesn't it feel peculiar to be holdin' antimatter? To break nodes ye'll need a **Matter** Annihilator, ye should craft it up now since it's used in some other crafts down the line.  

Also, make sure ye be craftin' the **Matter** annihilator, not the **Anti**matter annihilator.

### Meta

Requires: qid_a_bigger_platform, qid_antimatter

## Info: Bridging out
### ID: qid_info_bridging_out

### Text

Emitters be those blue nodes scattered around the core, be careful not to confuse 'em with the very similar lookin' skybox.  
Ye'll need an annihilator to extract resources from 'em, they'll behave exactly the same as a core, but they'll sometimes give ye emittrium.  
TIP: Ye can craft **Matter Platforms** to have a cheaper way of bridgin' out.  

### Meta

Requires: qid_annihilator

## Charged Field
### ID: qid_charged_field

### Text

Now, then. We have one more thing to do before we can start automatin'. Can ye guess what it be?  
That's right! We need power generation.  

To get goin', craft yerself a Simple Charged Field.  
But listen up! Charged Fields decay over time, leavin' indestructible residue (that decays in a relatively short time) behind. Since ye be usin' a Simple Charged Field, ye should expect to have energy fer about 10 minutes.  
Generators use energy even when there's nothin' connected to 'em. Since resources be infinite here, time be yer resource. Let's get automatin'.

### Meta

Requires: Introduction

## Matter Plates
### ID: qid_matter_plates

### Text

Matter Plates be often used fer machinery. They be simple to craft, yet very important.  

Ye can get four Matter Plates by placin' one matter blob into the crafting grid.

### Meta

Requires: qid_a_bigger_platform

## Switching Station
### ID: qid_switching_station

### Text

The Switching Station be an important node, fer it be the heart of any Power Grid.  
Ye **need** to have **one** Switching Station per power grid.  
Every machine needs to be connected to a Switching Station.  
The Switching Station also displays statistics about the Power Grid when hovered over in-world. When a machine says "no network found", it's not connected to the Switching Station and won't do anythin'.

When ye right-click a Switching Station, ye'll see a summary of all the machines connected.

### Meta

Requires: qid_matter_plates

## Info: What conducts power?
### ID: qid_info_what_conducts_power

### Text

Unlike most power systems, in Skyblock Zero's power system, almost all machines conduct power to other machines, so machines act like cables here.  
Cables be useful when ye have 2 far apart factories that ye want to connect, or fer aesthetics, or fer organization.  
The power unit be Cosmic Joules, and is abbreviated to Cj in most interfaces.  

### Meta

Requires: qid_switching_station

## Automation
### ID: qid_automation

### Text

Finally! Automation! Let's get on that, shall we? Ye'll need a **Simple Matter Extractor** and some **power** fer that.
TIP: Some early game machines without power emit red particles.

### Meta

Requires: qid_annihilator, qid_charged_field

## Advanced Extractors
### ID: qid_advanced_extractors

### Text

That be a shiny new machine ye've got there! Do ye also want to triple yer production? Only fer DOUBLE THE POWER? Aye ye do.  
  
Fer Advanced Extractors ye'll need a Simple Matter Extractor, then four Matter Annihilators and four matter Blobs. That be a lot of plunder, but this Extractor'll also occasionally generate Core Dust!  
  
Fer the curious, an Advanced Extractor has a 4% chance of extractin' core dust. This means a core dust'll be extracted every 40 seconds (on average), and it be about 3 times better at makin' matter dust.

### Meta

Requires: qid_automation

## Circuitry
### ID: qid_circuitry

### Text

Circuits be important craftin' components fer future recipes. Ye'll need 'em fer lots of recipes, and many of 'em too.  
  
Simple Circuits be currently yer only available Circuit type, but there be different circuit types which'll be used in the future. Also, all different Circuit types use Simple Circuits as their base.  
  
To craft a Simple Circuit, ye'll need one core dust and one matter blob. Ye'll get two Simple Circuits from that craft.

### Meta

Requires: qid_a_bigger_platform

## Manual Crafters
### ID: qid_manual_crafters

### Text

Manual crafters be nodes that allow ye to craft things very quickly. They don't require power, and **cannot** be used with automation.  
They also won't work with craftin' recipes that have "replacements", it'll instead simply consume those items. (Recipes like that be very rare in sbz, unless ye modified it.)  

**Controls:**  
- `place`: Configure  
- `punch`: Craft one item  
- `sneak+punch`: Craft 10 items  
- `aux1+punch` (usually `e+punch`): Craft all items  

### Meta

Requires: qid_circuitry

## Generators
### ID: qid_generators

### Text

Right now, ye're probably usin' Simple Charged Fields to generate yer power, but since they decay, they don't last forever, which be not convenient.  
  
To solve that, ye can use a Simple Charge Generator. It consumes **charged particles** as fuel over time, and provides ye with more power than Simple Charged Fields do. Ye can use **core dust** to fuel it as well.

It generates `36 Cj` with charged particles, `30 Cj` with core dust.

### Meta

Requires: qid_charged_field, qid_antimatter

## Retaining Circuits
### ID: qid_retaining_circuits

### Text

Retaining Circuits be a type of Circuit often used in nodes which store items, either permanently or temporarily. Circuits depend on other circuits which be why ye'll need a Simple Circuit to craft this Circuit.  
  
Unlike Simple Circuits, this'll only craft one Retaining Circuit.

TIP: With retaining circuits, ye can craft **Storinators** to permanently store items outside of yer inventory. (They be documented in the storage questline)

### Meta

Requires: qid_antimatter, qid_circuitry

## Pretty Pebbles
### ID: qid_pretty_pebbles

### Text

We're makin' the jump from generic matter to stone now! Here be where buildin' a space station gets fun!  
  
First, before we can make Stone nodes we'll need Pebbles. They be quite difficult to make, requirin' **three matter blobs**, so **havin' at least 4 advanced matter extractors be recommended**, as ye'll need a lot of pebbles.  
Pebbles'll unlock a lot of decorative nodes to spice up yer island, as well as plenty of tech, and if ye want ye can even start buildin' yer own planet. It be all up to yer imagination!

### Meta

Requires: qid_a_bigger_platform

## Concrete Plan
### ID: qid_concrete_plan

### Text

Just regular old boring stone, nothin' really to add here. Like, it be literally just stone. Ye know, the kind that would make even a rock collector yawn and say, "I've seen gravel with more personality". It sits around all day, doin' nothin'. No metamorphosis, no glitterin' crystals, just livin' its best sedentary life.  
  
That said, it be made using 9 pebbles.

### Meta

Requires: qid_pretty_pebbles

## Info: What to do next?
### ID: qid_info_what_to_do_next

### Text

The questbook isn't meant to be explored in a straight line. Ye should do quests in whichever order ye like.
If ye have inventory issues, the storage questline be within yer reach.
If ye want to explore more machines, check out the emittrium and chemistry questline.
Ye should also check out the meteorites questline, if ye don't, ye might wish ye'd seen it sooner.
If ye be a decorator, there be a questline fer ye too.
If ye want to actually automate (ye know, the fun part), see the pipeworks questline. Do that as soon as ye can.

Ye can also filter reachable quests (Quests that ye can see the descriptions of, but haven't completed yet) by typin' "reachable" into the questbook search bar

Tip: When settin' a goal, explore other quests to see if that goal could be done faster by usin' the tools from those quests. 
Example: Gettin' the Very Advanced Battery would be greatly helped by the pipeworks questline.

### Meta

Requires: qid_concrete_plan
