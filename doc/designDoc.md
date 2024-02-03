# Project Dunce
A dungeon crawler game made for the Warwick Game Jam 2024.
## Core mechanics ideas
- No classes
- Need to impress whoever is playing it within the first two minutes, and have them want to play more than just two minutes.
- Consumables, potions, scrolls, etc.
- Striking core idea
- Slowly rising challenge
- Accessibility options?
- Weapon, buffs/debuffs and consumables status system
- Random dungeon generation using a seed
- Varying smear frames for each weapon

## Stats
- Attack speed (fixed)
- Attack strength
- HP
- Walk speed (fixed but weapons affect it)

## Core systems
- Inventory and combat system (mvp)
- Dungeon generation (post mvp)

### Inventory:
Stores items (duh), store around 2 to 3 weapons, and one set of armour

We are able to equip one set of armour, and one weapon at any time, but we are unable to take it off.

### Combat
Minimal RNG in combat. Player can move with wasd, and 360 degree movement with controller (if we implement controller). Auto aiming with weapons. Each weapon attack has a slash in an area, any enemy hitbox within that area will take damage according to some algorithm

### Dungeon generation
Randomly generated, will update if implemented post mvp.

## Items
3-4 weapon types
- Greatsword
    - Large smear frame
    - Low range
    - High damage
    - Low movement speed
- Polearm
    - Mid ranged but narrow smar frame
    - Mid damage and speed
- Bow
    - Simple projectile shooter
- Knives/daggers
    - Low range but fast
- Could implement some magical curses post mvp
2-3 armour types

- Light, medium and heavy.
    - Varying speeds and levels of protection

## Assets and level design
- Player character
- Enemies
    - 2 base mobs - one high hp melee, one lower hp ranged
    - 1 final boss challenge
- Backgrounds and level design
    - Fixed size rooms including enemy and obstacle placements
    - MVP - 2 rooms and a chest room
- Stat blocks
- Consumables (post mvp)

## Image inspiration
<!---
please place all assets in assets, images are relatively referenced from where the md file is located
-->
![sk1](sk/sk1.jpg)
![sk2](sk/sk2.jpg)
![sk3](sk/sk3.jpg)