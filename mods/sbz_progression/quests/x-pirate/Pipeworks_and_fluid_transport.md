
# Questline: Pipeworks

If ye already know about regular pipeworks, skyblock_zero's pipeworks be a very modified version of that mod, but it'll be similar though.

## Tubes
### ID: qid_tubes

### Text

Have ye ever wanted to automatically move items around without input?  
  
Now ye can!  
  
Tubes be, well, tubes that can transport items around! Currently, ye can't interact with 'em, but just have some lyin' around—the next and future quests use 'em.  
  
TIP: Items in tubes'll go into directions with higher tube priority. The default tube priority be 100.

### Meta

Requires: qid_furnace

## Automatic Filter-Injectors
### ID: qid_automatic_filter_injectors

### Text

Have ye ever been tired of takin' items out of nodes? Do ye just want to interact with tubes as soon as possible?  
Now ye can!  
The Automatic Filter-Injector takes stacks of items from nodes and places 'em into tubes or other nodes.  
  
\<big\>The Automatic Filter-Injector has two settings:\</big\>  
**The slot sequence (allows ye to change the order that items are taken out):**  
Priority: Takes items out in first-out order  
Randomly: Takes items out in a random order  
Rotation: Takes items out in a cyclic order  
**The match mode (sets the behavior when takin' out items):**  
Exact match - off: If an item matches the filter, it takes out the whole stack  
Exact match - on: If an item matches the filter and the stack be higher, it takes out the filter count. For example, if the filter be set to 5 matter and it be pullin' from a stack of 60 matter, it'll pull out 5 matter until the stack be below 5 or empty.  
Threshold: If an item matches the filter and the stack be higher, it takes out items until the stack matches the filter. For example, if ye have a filter of 5 matter and a stack of 60, it'll pull 55 matter out of the stack.  

### Meta

Requires: qid_bear_arms, qid_tubes

## Info: Matter Factory
### ID: qid_info_matter_factory

### Text

Usin' advanced matter extractors, some automatic filter injectors, tubes, and a Storinator, ye can make a really good matter factory.  
Advanced matter extractors be crazy fast fer their cost, so with around 5 of 'em, ye'll get lots of matter in no time.  
  
Here be an example of one:  
\<img name=questbook_image_matter_factory.png width=483 height=453\>  

### Meta

Requires: qid_automatic_filter_injectors, qid_tubes

## Node Breakers
### ID: qid_node_breakers

### Text

Node Breakers try to break the node in front of 'em. The drops be ejected out the back-side. They need 20 power fer each node dug. To make "caveman automation" (non-Lua automation) more powerful, plants that haven't finished growin' cannot be dug by the Node Breaker. If ye insert a tool that requires power (fer example, a laser), the node breaker'll try to charge it, consumin' more power.

### Meta

Requires: qid_automatic_filter_injectors

## Deployers
### ID: qid_deployers

### Text

Deployers try to place a node into their front-side. That be about it.

### Meta

Requires: qid_automatic_filter_injectors, qid_bear_arms

## Punchers
### ID: qid_punchers

### Text

Punchers punch stuff, allowin' ye to automate resource generation even more. But ye need to give 'em somethin' to punch with.

### Meta

Requires: qid_automatic_filter_injectors, qid_bear_arms, qid_emittrium_circuits

## Autocrafters
### ID: qid_autocrafters

### Text

Autocrafters automatically craft. They require a crafting processor item to run, which ye can upgrade as ye progress through the game, to increase crafting speed.

### Meta

Requires: qid_bear_arms, qid_neutronium, qid_emittrium_circuits, qid_automatic_filter_injectors

## Simple Crafting Processors
### ID: qid_simple_crafting_processors

### Text

The first tier of Crafting Processors. This one crafts at a speed of one item per second, fer 10 power. The higher tiers of crafting processors won't have quests associated with 'em, so here be their stats:

Simple Crafting Processor: 1 item/s & 10 power
Quick Crafting Processor: 2 items/s & 25 power
Fast Crafting Processor: 4 items/s & 50 power
Accelerated Silicon Crafting Processor: 8 items/s & 100 power
Nuclear Crafting Processor: 16 items/s & 175 power

### Meta

Requires: qid_autocrafters

## Item Voids
### ID: qid_item_voids

### Text

Item Voids delete every item that goes in, and aye, these be Pipeworks trash cans. But unlike pipeworks trash cans, they show the amount of items they've destroyed.  

### Meta

Requires: qid_tubes

## Info: Overflow Handling
### ID: qid_info_overflow_handling

### Text

Tubes break when they have too many stacks in 'em. This may not appear as a problem at first, but when ye think about it, it can be a huge issue.  
**If we have this setup:**  
\<img name=questbook_image_basic_setup.png\>  
Then there might be an issue if the Storinator that we be puttin' items into be completely filled.  
In cases where there be only one tube, the item'll simply drop, but when there be at least two tubes, the items'll wander around until eventually there be too many of 'em. In that case, the tubes'll break.  
How do we prevent our tubes from breakin' or items from droppin'?  
Well, a simple answer would be to have more storinators :D..... but that's not practical.
  
**Instead, consider usin' item voids like this:**  
<img name=questbook_image_overflow_handling.png>

Item voids have the lowest priority, so items really don't want to go there.
Storinators have a higher priority than Item Voids, so if the Storinator isn't full, items'll want to go there.  
Item Voids have a lower priority, so if the item can't go to the Storinator, it'll go into the Item Void.  
  
The default priority of nodes be 100.

### Meta

Requires: qid_item_voids

## Item Vacuums
### ID: qid_item_vacuums

### Text

Item Vacuums vacuum up items in a 16-block radius, but they tend to cause lag.

### Meta

Requires: qid_neutronium, qid_tubes

## Teleport Tubes
### ID: qid_teleport_tubes

### Text

So, I think ye want to transmit items over long distances. Well, teleport tubes help with that! They pretty much explain themselves, so good luck!
  
Oh wait, one thing to mention: items'll fall off the receiving tube if ye don't use a high-priority tube next to it.

### Meta

Requires: qid_tubes, qid_crystal_grower

## One Direction Tubes
### ID: qid_one_direction_tubes

### Text

This be a tube that accepts items from all directions but only allows 'em to go in one direction.  
If ye hover over it, it'll spawn a white particle. The direction of the white particle be the direction that the items'll go in.  
  
To change that direction, sneak and punch it on the side that ye want the items to go in.  

### Meta

Requires: qid_tubes

## Automatic Turrets
### ID: qid_automatic_turrets

### Text

Do ye want to automatically shoot down meteorites or even shoot down players? The automatic turret'll help with that. It be similar to the node breaker but does not dig nodes. Equip it with a laser to get started. But be warned: near spawn, the turret's range gets decreased by 80%. If ye insert a tool that requires power, fer example lasers, it'll try to charge the laser, resultin' in more power usage.

### Meta

Requires: qid_node_breakers, qid_neutronium

## Instatubes
### ID: qid_instatubes

### Text

Instatubes be tubes that be instant. They be generally less laggy than their regular pipeworks tube counterparts WHEN USED CORRECTLY. They can be a lot more laggy if ye use 'em incorrectly.  
  
Instatubes work differently than regular tubes.  
They internally create a list of all the receivers, then sort the receivers based on priority. The receivers with the highest priority'll be given the items first. If they be full, it'll move on to the receiver with lower priority.  
This be different from regular pipeworks tubes, in a way that's hard to explain, so a visual example be best:  
\<img name=questbook_image_instatubes_vs_pipeworks_tubes.png\>  
Suppose that the green storinators have a priority of 99 (they don't, but it'll make explainin' this easier). That be higher than regular pipeworks tubes but lower than regular storinators.  
In that case, with default pipeworks tubes, items'll flow first to the green Storinator, then once it's full, they'll flow to the regular Storinator.  
Instatubes work differently: they'll choose the Storinator with the highest priority first, then the lowest. So items would flow first into the regular Storinator, and once that be full, they'll flow to the green Storinator.  
  
Overflow handlin': simply put an item void connected to the instatubes (ye might need to connect it to a few low-priority tubes if ye use those anywhere, as it has a priority of only one, and ye can go below that).  
  
Now, some things be just impossible with the basic instatube, so there be more types of instatubes :D. This'll cover all of 'em.
  
\<big\>Priority Instatubes\</big\>  
(Low priority instatubes, high priority instatubes)  
  
They change the priority of all the machines on their "branch". To explain this better, here it be visually:  
\<img name=questbook_image_instatube_priority.png width=450\>  
  
\<big\>Teleport Instatube\</big\>  
It teleports items... But be not quite the same as usin' the pipeworks instatube, because teleport instatubes'll check all teleport instatubes and give the item to the highest-priority receiver instead of just sendin' items to one randomly.  
\<big\>Cycling Input Instatube\</big\>  
This instatube be only useful when placed next to somethin' that outputs items (fer example, Filter Injectors and Blast Furnace Output Ports).
It completely ignores the priority of receivers and instead cycles between 'em.
  
\<big\>Randomized Input Instatube\</big\>  
Like the cycling input instatube, but it gives the item to a random receiver.
  
\<big\>Instatube Item Filter\</big\>  
Similar to the item sorter, but it only governs what can pass through that tube. (The advantage of usin' it over item sorters be that it'll respect priority, and no short-lived entities'll be created.)  
  
\<big\>One-Way Instatubes\</big\>  
Instatubes that only allow items to flow in one direction, useful when havin' multiple filter injectors.

\<bigger\>Performance\</bigger\>
With big speed comes big responsibility.

The lag from instatubes may show up in yer switching station as lag from the thing that be insertin' to 'em. (Fer example Automatic Filter-Injectors or punchers). The lag from pipeworks tubes does not show up in there.

1st tip: Don't make all of yer base a single large instatube network. (unless ye know what ye are doin', and know the flaws of instatubes)  
2nd tip: Don't transport MANY small item stacks in a large instatube network, <b>have one or the other</b>. Always prefer larger item stacks. (Instead of sendin' 100 matter blobs in separate stacks to a large network, just send one stack of matter blobs)
3rd tip: Only debug performance when it matters. (fer example: ye notice unusually high lag from filter injectors, or from yer 500 puncher setup)

Practical example: Say ye want to wire up 50 punchers to yer base fer processin', how should ye go about doin' this?  
Well, ye'll be transportin' 50 item stacks per second, dependin' on the network size, that be a lot!

What ye SHOULDN'T do:
(In these images, storinators may be in any place, and they don't have to be storinators, they can be machines or even other punchers, they just have to be connected to the punchers in some way, and the punchers can be anythin' that produces large amounts of very tiny item stacks)
\<img name=questbook_image_instatube_performance_wrong.png width=400\>  
In this image, fer each item the punchers send out, it needs to iterate over everything in the network (so storinators, punchers) to find somethin' that isn't full, this isn't ideal fer performance if ye be gettin' 100 item stacks per second.

What ye SHOULD do instead:
\<img name=questbook_image_instatube_performance_correct.png width=400\>  
(Don't forget to actually power those filter injectors)

In this case, the many little item stacks that get sent to that storinator, or if that storinator got filled, to the item void.
So in the worst case, an item only needs to iterate through 2 things (the collection storinator and the item void) to determine where to go.
There aren't as many item stacks that get sent to the larger network, because those item stacks'll contain more items. (Instead of sendin' 200 "sbz_resources:matter_dust 1", it'll just send 1 "sbz_resources:matter_dust 200" if that makes sense, and that be faster)
The high priority instatube here be redundant but useful if ye aren't workin' with punchers.
  
**To complete this quest, craft an instatube.**  

### Meta

Requires: qid_blast_furnace

## Pattern Storinator
### ID: qid_pattern_storinator

### Text

It be a Storinator with 16 slots of storage and 16 slots fer the pattern.  
The pattern slots govern how the storage slots can be filled. If a pattern has 43 Matter Dust in the first slot, then there can be only up to 43 Matter Dust in that slot, similar to how the Autocrafter does it.  
  
By default, the Filter Injector does nothin' to the Pattern Storinator.  
When the Pattern Storinator be full (storage matches the pattern), it'll allow usin' Filter Injectors but disallow inputtin' items into the Pattern Storinator.  
Once it be empty, ye'll be able to insert into it again, and filter injectors'll stop workin' on it.
  
The Pattern Storinator can be used in machines like the Meteorite Maker, where yer flow rate of emittrium and matter blobs might otherwise cause cloggin'.

### Meta

Requires: qid_automatic_filter_injectors

# Questline: Fluid Transport

This questline be about transportin' fluids.

## Fluid Pipes
### ID: qid_fluid_pipes

### Text

A fluid pipe be like an (Insta)tube, but with fluids. They move fluids around just like how tubes move items around.

### Meta

Requires: qid_tubes

## Fluid Pumps
### ID: qid_fluid_pumps

### Text

Fluid Pumps be automatic filter-injectors, but fer pipes. They take fluids from fluid inventories.

### Meta

Requires: qid_automatic_filter_injectors

## Fluid Storage Tanks
### ID: qid_fluid_storage_tanks

### Text

Fluid Storage Tanks be storinators fer fluids. They can store 100 nodes of fluid. That be a lot! (But not really if ye compare it to the amount of nodes that a basic Storinator can store.)

Tip: Once any fluid storage has received one type of liquid, it'll always continue to receive that type of liquid.  
This means that if ye have a fluid storage that was previously filled with liquid aluminium, but now ye want to fill it with water, ye'll need to replace that fluid storage block.  
This applies to pretty much all of fluid transport.  

### Meta

Requires: qid_tubes, qid_storinators

## Fluid Capturers
### ID: qid_fluid_capturers

### Text

Fluid Capturers capture liquid **sources** from their top and store 'em. Ye can take out the captured fluid with a fluid pump.

### Meta

Requires: qid_fluid_storage_tanks

## Fluid Cell Fillers
### ID: qid_fluid_cell_fillers

### Text

Fluid Cell Fillers fill empty fluid cells in their inventories.

### Meta

Requires: qid_fluid_storage_tanks
