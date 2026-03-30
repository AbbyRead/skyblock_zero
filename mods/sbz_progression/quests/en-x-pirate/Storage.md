# Questline: Storage

Mainly about drawers and Storinators.

## Storinators
### ID: qid_storinators

### Text

Storinators be the solution to clogged up inventories. They have 32 slots of inventory, and function like a chest.  
The more red/green dots the front of a Storinator displays, the more full/empty it be.  

### Meta

Requires: qid_matter_plates, qid_charged_field, qid_retaining_circuits

## Better Storinators
### ID: qid_better_storinators

### Text

At some point, only havin' 32 slots of storage be not enough.  
Ye can make more Storinators, or ye can make an upgraded one.  
Each upgrade adds 1 row and 1 column to the inventory space.  
  
To complete this quest, ye need to craft the bronze Storinator.  

### Meta

Requires: qid_storinators, qid_bronze_age

## Public Storinators
### ID: qid_public_storinators

### Text

Public Storinators be like regular Storinators but be accessible to **anyone**, regardless of protections. Ye can craft 'em by simply puttin' any type of Storinator in yer crafting guide.

### Meta

Requires: qid_storinators

## Best Storinators
### ID: qid_best_storinators

### Text

Do ye have chaos in yer Storinators? Are ye strugglin' to figure out which one be which? Do ye need labels, but signs get in the way?  
Ye can use Neutronium Storinators. They be a little expensive, requirin' 4 Neutronium, but if ye can afford 'em, they be great fer this.  

### Meta

Requires: qid_better_storinators, qid_neutronium

## Drawers
### ID: qid_drawers

### Text

Do ye have some automation that produces large amounts of one type of item?  
Or do ye just have large amounts of a single item type?  

Drawers'll help here. They be like Storinators, but they can only store a few item types.
They store 3200 items (without upgrades). With upgrades, they can store a lot more.  

Drawers also come with 1x2 and 4x4 variants.  

### Meta

Requires: qid_storinators

## Drawer Upgrades
### ID: qid_drawer_upgrades

### Text

Drawers by default store the same amount of items as a Storinator; that be a bit borin'. What if ye could store more?

TIP: The upgrades don't work as ye might expect. If ye have two bronze upgrades, each bronze upgrade adds an extra 3200 items; it doesn't multiply 3200 by 4 or anythin' like that.  
TIP: To insert an upgrade into a drawer, ye need to right-click the edge of it or right-click a side that doesn't have the item display.

### Meta

Requires: qid_drawers, qid_bronze_age

## Drawer Controller
### ID: qid_drawer_controller

### Text

Ye may have noticed that drawers still might not work amazingly fer automation; the drawer controller be here to solve that.  
If ye send it an item with a tube or manually provide it an item, it'll automatically put it into an adjacent drawer (or a drawer adjacent to the others).  

Fer takin' out items, ye can use a Luacontroller, sendin' an itemstack (a string like `"sbz_bio:dirt 100"`), and it'll try to give ye that dirt by injectin' it out of itself.  

### Meta

Requires: qid_drawers

## Room Containers
### ID: qid_room_containers
### Text

Do ye want to just put things in a room? This node was made fer that.

Room containers contain 16x16x16 rooms (if ye count the walls) that be inside one mapblock. A player can only have 100 rooms at most.

If ye break a room container, don't worry, the next room container ye place'll point to that same room.

Room containers can also accept power and teleport it to a room.

Right-click a room to teleport to it, and right-click the room exit (a special block inside the wall) to exit the room.

To set a custom entry point to the room, craft the "Room Container Entry Point" block and place it in a room.

Warning: To save the positions of rooms, room containers use an experimental luanti function (that has been experimental and mostly unchanged since 2016), this might not be that big of a concern but <b>ye shouldn't put yer entire storage system in a room container</b> because of that. It be unclear how reliable the saving/loading of room containers be.
Server owners should ideally have backups.

Warning: The power input functionality may not work correctly on servers (by default), or on Skyblock Zero configurations that have the "sbz_switching_station_unload" setting active, it may be unusable, sorry.

### Meta

Requires: qid_warpshrooms
