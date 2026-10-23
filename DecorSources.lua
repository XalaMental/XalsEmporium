-- DecorSources.lua
-- Xal's Emporium - hand-researched decor acquisition data.
--
-- The game's own C_HousingCatalog sourceText is often vague (just a zone name
-- or nothing at all). This is the same kind of hand-maintained reference data
-- as Reins' MountSteps.lua/VideoLinks.lua - real vendor names, zones, and
-- coordinates researched from worldofhousing.io's decor catalogue and
-- umbralmarket.com/housing-hub's per-item "where to get it" pages, keyed by
-- the item's exact in-game name so it can be looked up without needing the
-- item's ID.
--
-- `x`/`y` are the vendor's real in-game coordinates (the same 0-100 style
-- numbers a `/way` command uses), ONLY included when a real source actually
-- published them - never estimated or guessed. This is what lets
-- DecorData:ClosestZoneEntry() pick an actual nearest vendor instead of just
-- the first match, for anything with a fixed real-world position (vendor,
-- quest giver). It doesn't help with plain drops, which have no fixed spot.
--
-- Coverage is partial and grows over time - 2,083+ decor items exist and this
-- covers a first researched batch, not the whole catalog. An item with no
-- entry here just falls back to the game's own sourceText, same as before.
--
-- Every name/coordinate below is pulled from a real source, not invented -
-- do not add a placeholder or guessed value here.

local addonName, addonTable = ...

addonTable.DecorSources = {
    ["\"A Bridge Over Calm Waters\" Painting"] = {
        method = "Achievement", vendor = "Corlen Hordralin", x = 44.13, y = 62.76, zone = "Silvermoon City",
    },
    ["\"Autumnal Eversong\" Painting"] = {
        method = "Achievement", vendor = "Corlen Hordralin", x = 44.13, y = 62.76, zone = "Silvermoon City",
    },
    ["\"Autumnal Eversong\" Unframed Painting"] = {
        method = "Vendor", vendor = "Hesta Forlath", x = 44.2, y = 62.7, zone = "Silvermoon City",
    },
    ["\"Brunch and a Book\" Painting"] = {
        method = "Achievement", vendor = "Corlen Hordralin", x = 44.13, y = 62.76, zone = "Silvermoon City",
    },
    ["\"Brunch and a Book\" Unframed Painting"] = {
        method = "Vendor", vendor = "Hesta Forlath", x = 44.2, y = 62.7, zone = "Silvermoon City",
    },
    ["\"Dawning Hope\" Mosaic"] = {
        method = "Reputation", vendor = "Vindicator Nuurem", x = 46.6, y = 76.2, zone = "Stormshield",
    },
    ["\"Elegant\" Lawn Flamingo"] = {
        method = "Quest", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine",
    },
    ["\"Eversong Lantern\" Painting"] = {
        method = "Achievement", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods",
    },
    ["\"Fruit of the Arcan'dor\" Painting"] = {
        method = "Reputation", vendor = "First Arcanist Thalyssra", x = 34.8, y = 48.1, zone = "Suramar",
    },
    ["\"Nature's Strength\" Painting"] = {
        method = "Achievement/Crafted (Inscription)", vendor = "Corlen Hordralin", x = 44.13, y = 62.76, zone = "Silvermoon City",
    },
    ["\"Night on the Jeweled Estate\" Painting"] = {
        method = "Achievement", vendor = "Jocenna", x = 49.6, y = 62.8, zone = "Suramar",
    },
    ["\"Raising Your Eyes\" Painting"] = {
        method = "Quest", vendor = "Rasil Fireborne", x = 43.6, y = 49.2, zone = "Dalaran",
    },
    ["\"Shu'halo Perspective\" Painting"] = {
        method = "Vendor", vendor = "Cravitz Lorent", zone = "Murder Row (dungeon)",
    },
    ["\"Sunrise Canyon\" Painting"] = {
        method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point",
        x = 52.0, y = 38.3,
    },
    ["\"The Harbinger\" Painting"] = {
        method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City",
    },
    ["\"The High Exarch\" Painting"] = {
        method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City",
    },
    ["\"The Ranger of the Void\" Painting"] = {
        method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City",
    },
    ["\"The Redeemer\" Painting"] = {
        method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City",
    },
    ["590 Quel'Lithien Red"] = {
        method = "Vendor", vendor = "Hesta Forlath", x = 53, y = 38.2, zone = "Founder's Point",
    },
    ["Founder's Point Front Door"] = {
        method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point",
        x = 52.0, y = 38.3,
        hordeVendor = "\"High Tides\" Ren", hordeZone = "Razorwind Shores",
        hordeX = 39.8, hordeY = 72.8,
    },

    -- Second research batch (worldofhousing.io catalogue, pages 2-4) - vendor
    -- and zone only, no coordinates yet (not published on the pages fetched).
    -- Still real, verified names - not invented.
    ["Acherus Worktable"] = { method = "Vendor", vendor = "Quartermaster Ozorg", x = 99.4, y = 57.2, zone = "Broken Shore" },
    ["Admiral's Bed"] = { method = "Quest", vendor = "Pearl Barlow", x = 70.8, y = 15.8, zone = "Boralus", mapID = 1161 },

    ["Admiral's Chandelier"] = { method = "Quest", vendor = "Delphine", x = 53.4, y = 31.2, zone = "Tiragarde Sound", mapID = 895 },

    ["Admiral's Low-Hanging Chandelier"] = { method = "Quest", vendor = "Delphine", x = 53.4, y = 31.2, zone = "Tiragarde Sound", mapID = 895 },

    ["Admiralty's Copper Lantern"] = { method = "Reputation", vendor = "Caspian", x = 59.5, y = 69.6, zone = "Stormsong Valley", mapID = 942 },

    ["Admiralty's Upholstered Chair"] = { method = "Quest", vendor = "Pearl Barlow", x = 70.8, y = 15.8, zone = "Boralus", mapID = 1161 },

    ["Akunda the Tapestry"] = { method = "Quest", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Alliance Battlefield Banner"] = { method = "Achievement", vendor = "Riica", zone = "Stormwind City", x = 77.8, y = 65.6, mapID = 84 },

    ["Alliance Dueling Flag"] = { method = "Achievement", vendor = "Riica", zone = "Stormwind City", x = 77.8, y = 65.6, mapID = 84 },

    ["Altar of the Corrupted Flames"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Altar of the Shul'ka"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Amani Crafter's Tool Rack"] = { method = "Vendor", vendor = "Chel the Chip", x = 31.6, y = 26.2, zone = "Zul'Aman" },
    ["Amani Dreamer's Charm"] = { method = "Vendor", vendor = "Depthdiver Tu'nakit", x = 68.2, y = 20.2, zone = "Zul'Aman", mapID = 2437 },

    ["Amani Incense Burner"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Amani Slate Bench"] = { method = "Vendor", vendor = "Chel the Chip", x = 31.6, y = 26.2, zone = "Zul'Aman" },
    ["Amani Spearhunter's Spit"] = { method = "Vendor", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Amani Strongbox"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, mapID = 2393 },
    ["Amani Trophy Frame"] = { method = "Vendor", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Amani War Drum"] = { method = "Vendor", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Amirdrassil Stool"] = { method = "Vendor", vendor = "Mythrin'dir", x = 54, y = 60.4, zone = "Amirdrassil", mapID = 2239 },
    ["Ancient Kaldorei Coffer"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, mapID = 2393 },
    ["Ancient Weyrn Device"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Ancient Zandalari Ritual Scroll"] = { method = "Vendor", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Angled Ethereal Pipe Segment"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["Arakkoan Alchemy Tools"] = { method = "Reputation", vendor = "Shadow-Sage Brakoss", x = 45.8, y = 74.8, zone = "Stormshield", mapID = 622 },

    ["Arathi Bartender's Shelves"] = { method = "Quest", vendor = "Nalina Ironsong", x = 42.8, y = 55.8, zone = "Hallowfall", mapID = 2215 },

    ["Arched Rose Trellis"] = { method = "Vendor", vendor = "Samantha Buckley", x = 65.2, y = 47.2, zone = "Ruins of Gilneas City", mapID = 218 },
    ["Architect's Drafting Table"] = { method = "Quest", vendor = "Sergeant Crowler", x = 38.33, y = 31.95, zone = "Lunarfall", mapID = 582 },

    ["Arcwine Counter"] = { method = "Reputation", vendor = "First Arcanist Thalyssra", x = 34.8, y = 48.1, zone = "Suramar", mapID = 680 },

    ["Artisan's Measuring Scales"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Artisanal Display Tent"] = { method = "Vendor", vendor = "Hesta Forlath", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Astalor's Hookah"] = { method = "Vendor", vendor = "Hesta Forlath", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Augmenter's Opal Banner"] = { method = "Vendor", vendor = "Tethalash", x = 25.6, y = 33.8, zone = "Valdrakken", mapID = 2112 },

    ["Automated Gnomeregan Guardian"] = { method = "Reputation", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Autumn Leaf Pile"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Azsharan Firespear Tree"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Backboard and Hoop Playset"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon", mapID = 2393 },
    ["Banner of the Amani Tribe"] = { method = "Quest", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Banner of the Ebon Blade"] = { method = "Quest", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Banner of the Unseen Path"] = { method = "Vendor", vendor = "Outfitter Reynolds", x = 44.6, y = 48.9, zone = "Trueshot Lodge", mapID = 739 },

    ["Baradin Bay Fishing Rack"] = { method = "Vendor", vendor = "Stuart Fleming", x = 6.28, y = 57.45, zone = "Wetlands", mapID = 56 },

    ["Barebone Rope Charm"] = { method = "Vendor", vendor = "Depthdiver Tu'nakit", x = 68.2, y = 20.2, zone = "Zul'Aman", mapID = 2437 },

    ["Barrens Hosta Bush"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Bejeweled Silvermoon Chandelier"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Bel'ameth Angled Platform"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Bel'ameth Barrel"] = { method = "Vendor", vendor = "Ellandrieth", x = 48.2, y = 53.6, zone = "Amirdrassil", mapID = 2239 },
    ["Bel'ameth Beam Platform"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Bel'ameth Bench"] = { method = "Vendor", vendor = "Ellandrieth", x = 48.2, y = 53.6, zone = "Amirdrassil", mapID = 2239 },
    ["Bel'ameth Crafter's Tent"] = { method = "Vendor", vendor = "Mythrin'dir", x = 54, y = 60.4, zone = "Amirdrassil", mapID = 2239 },
    ["Bel'ameth Interior Doorway"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Bel'ameth Interior Narrow Wall"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Bel'ameth Interior Wall"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Bel'ameth Large Platform"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Bel'ameth Round Interior Pillar"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Bel'ameth Round Platform"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Bel'ameth Traveler's Pack"] = { method = "Quest", vendor = "Ellandrieth", x = 48.2, y = 53.6, zone = "Amirdrassil", mapID = 2239 },
    ["Bel'ameth Wooden Table"] = { method = "Vendor", vendor = "Ellandrieth", x = 48.2, y = 53.6, zone = "Amirdrassil", mapID = 2239 },
    ["Berserker's Empowerment"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Black Harvest Banner"] = { method = "Vendor", vendor = "Gigi Gigavoid", x = 58.5, y = 33.4, zone = "Dreadscar Rift", mapID = 1107 },

    ["Black Harvest Orrery"] = { method = "Vendor", vendor = "Gigi Gigavoid", x = 58.5, y = 33.4, zone = "Dreadscar Rift", mapID = 1107 },


    -- Third research batch (worldofhousing.io catalogue, pages 5-6).
    ["Boiling Amani Cauldron"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Bolt Chair"] = { method = "Vendor", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Bookcase of Gonk"] = { method = "Achievement", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Boralus Fence"] = { method = "Reputation", vendor = "Provisioner Fray", x = 67.5, y = 21.5, zone = "Boralus", mapID = 895 },

    ["Boralus Fencepost"] = { method = "Reputation", vendor = "Provisioner Fray", x = 67.5, y = 21.5, zone = "Boralus", mapID = 895 },

    ["Boralus String Lights"] = { method = "Reputation", vendor = "Provisioner Fray", x = 67.5, y = 21.5, zone = "Boralus", mapID = 895 },

    ["Boulder Springs Recliner"] = { method = "Achievement", vendor = "Garnett", x = 54.6, y = 57.2, zone = "Dornogal", mapID = 2339 },

    ["Bowhull Bookcase"] = { method = "Reputation", vendor = "Caspian", x = 59.5, y = 69.6, zone = "Stormsong Valley", mapID = 942 },

    ["Bradensbrook Smoke Lantern"] = { method = "Quest", vendor = "Corbin Branbell", x = 42, y = 59.4, zone = "Val'sharah", mapID = 641 },

    ["Bradensbrook Thorned Well"] = { method = "Quest", vendor = "Corbin Branbell", x = 42, y = 59.4, zone = "Val'sharah", mapID = 641 },

    ["Brawler's Barricade"] = { method = "Vendor", vendor = "Paul North", x = 50.5, y = 27.4, zone = "Brawl'gar Arena", mapID = 503 },

    ["Brawler's Guild Punching Bag"] = { method = "Vendor", vendor = "Paul North", x = 50.5, y = 27.4, zone = "Brawl'gar Arena", mapID = 503 },

    ["Brazier of Elune"] = { method = "Achievement", vendor = "Amurra Thistledew", x = 40.2, y = 21.0, zone = "The Dreamgrove", mapID = 747 },

    ["Brennadam Coop"] = { method = "Quest", vendor = "Caspian", x = 59.5, y = 69.6, zone = "Stormsong Valley", mapID = 942 },

    ["Brumewood Hollow Large Garden Cluster"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Bubbling Haranir Cauldron"] = { method = "Vendor", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Burning Amani Pinecone"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Bwonsamdi's Golden Gong"] = { method = "Quest", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Candle-Festooned Wooden Awning"] = { method = "Quest", vendor = "Gabbun", x = 43.4, y = 33.2, zone = "The Ringing Deeps", mapID = 2214 },

    ["Cartel Collector's Cage"] = { method = "Quest", vendor = "Ta'sam", x = 43.2, y = 35.2, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["Cartel Head's Schmancy Desk"] = { method = "Quest", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Carved Idol of Akil'zon, Loa of Victory"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Carved Idol of Halazzi, Loa of the Hunt"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Carved Idol of Jan'alai, Loa of Fire"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Carved Idol of Nalorakk, Loa of War"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Carved Wooden Bar Table"] = { method = "Quest", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Carved Wooden Crate"] = { method = "Quest", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Ceiling Cobweb"] = { method = "Vendor", vendor = "Lonomia", x = 68.2, y = 75.5, zone = "Razorwind Shores", mapID = 2351 },

    ["Cenarion Arch"] = { method = "Achievement", vendor = "Amurra Thistledew", x = 40.2, y = 21.0, zone = "The Dreamgrove", mapID = 747 },

    ["Cenarion Privacy Screen"] = { method = "Reputation", vendor = "Sylvia Hartshorn", x = 54.70, y = 73.25, zone = "Val'sharah", mapID = 641 },

    ["Cenarion Rectangular Rug"] = { method = "Reputation", vendor = "Sylvia Hartshorn", x = 54.70, y = 73.25, zone = "Val'sharah", mapID = 641 },

    ["Cenarion Round Rug"] = { method = "Reputation", vendor = "Sylvia Hartshorn", x = 54.70, y = 73.25, zone = "Val'sharah", mapID = 641 },

    ["Ceramic Kafa Mug"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Ceramic Loamm Bowl"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Challenger's Dueling Flag"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Champion Brawler's Gloves"] = { method = "Vendor", vendor = "Paul North", x = 50.5, y = 27.4, zone = "Brawl'gar Arena", mapID = 503 },

    ["Chaotic Empowerment"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Charming Couch"] = { method = "Quest", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Charming Laurel Tree"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Charming Seat Cushion"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Checkered Charming Seat Cushion"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Circular Elven Floor Rug"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Circular Elven Table"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Circular Sin'dorei Rug"] = { method = "Vendor", vendor = "Rae'ana", x = 47.8, y = 82, zone = "The Waking Shores", mapID = 2022 },
    ["Circular Woolen Rug"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["City Wanderer's Candleholder"] = { method = "Quest", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Clefthoof Hide Rug"] = { method = "Vendor", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Closed Folk Curtains"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Closed Leather Curtains"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Coal-Fired Stovetop"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Collection of Arathi Scripture"] = { method = "Vendor", vendor = "Lars Bronsmaelt", x = 28.28, y = 56.20, zone = "Hallowfall", mapID = 2215 },

    ["Colossal Amani Stone Visage"] = { method = "Achievement", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Commander's Kafa Mug"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", mapID = 2352 },


    -- Fourth research batch (worldofhousing.io catalogue, pages 7-8).
    ["Complete Guide to K'areshi Wrappings, Vol. 11"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Conclave Pedestal"] = { method = "Vendor", vendor = "Meridelle Lightspark", x = 39.2, y = 24.7, zone = "Netherlight Temple", mapID = 702 },

    ["Conjured Altar of the Guardian"] = { method = "Achievement", vendor = "Jackson Watkins", x = 45.4, y = 57.0, zone = "Hall of the Guardian", mapID = 735 },

    ["Conjured Archive of the Tirisgarde"] = { method = "Achievement", vendor = "Jackson Watkins", x = 45.4, y = 57.0, zone = "Hall of the Guardian", mapID = 735 },

    ["Consortium Energy Banner"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Consortium Energy Barrel"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Consortium Energy Collector"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Consortium Energy Crate"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Consortium Glowpost"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Copper Stormsong Well"] = { method = "Reputation", vendor = "Caspian", x = 59.5, y = 69.6, zone = "Stormsong Valley", mapID = 942 },

    ["Copper Tidesage's Sconce"] = { method = "Quest", vendor = "Caspian", x = 59.5, y = 69.6, zone = "Stormsong Valley", mapID = 942 },

    ["Corewarden's Spoils"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, mapID = 2393 },
    ["Coreway Sentinel Lamppost"] = { method = "Quest", vendor = "Chert", x = 43.2, y = 32.8, zone = "The Ringing Deeps", mapID = 2214 },

    ["Corner Ethereal Pipe Segment"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["Corruption Pit"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Cosmic Barrel"] = { method = "Quest", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Cosmic Chalice"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Cosmic Kettle"] = { method = "Quest", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Cosmic Traveler's Satchel"] = { method = "Quest", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Cosmic Void Ashwell"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Cosmic Void Campfire"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Cosmic Void Crate"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Cosmic Void Orb"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Cosmic Void Summoning Crystal"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Cosmic Void Table"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Cosmic Void Training Dummy"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Councilward's Jeweled Goblet"] = { method = "Drop", zone = "Isle of Dorn" },
    ["Covered Ornate Suramar Table"] = { method = "Quest", vendor = "Jocenna", x = 49.6, y = 62.8, zone = "Suramar", mapID = 680 },

    ["Covered Small Suramar Table"] = { method = "Quest", vendor = "Jocenna", x = 49.6, y = 62.8, zone = "Suramar", mapID = 680 },

    ["Covered Wooden Table"] = { method = "Quest", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Cozy Four-Pipe Bed"] = { method = "Quest", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Cozy Hide-Covered Bench"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Creeping Corner Ivy"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Creeping Lattice Ivy"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Crescent Moon Lamppost"] = { method = "Quest", vendor = "Selfira Ambergrove", x = 54.2, y = 72.4, zone = "Val'sharah", mapID = 641 },

    ["Crimson Lightwood Privacy Screen"] = { method = "Reputation", vendor = "Neriv", x = 43.49, y = 47.65, zone = "Eversong Woods", mapID = 2395 },

    ["Crimson Silvermoon Runner"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Crucible Votive Rack"] = { method = "Drop", vendor = "Zaxasj the Speaker", zone = "Crucible of Storms" },
    ["Crude Banded Crate"] = { method = "Quest", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Dalaran Espresso Machine"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Dalaran Kafa Grinder"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Dalaran Kafa Table"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Dark Iron Brazier"] = { method = "Achievement", vendor = "Dedric Sleetshaper", x = 25, y = 42, zone = "Ironforge", mapID = 87 },

    ["Dark Iron Expedition Tent"] = { method = "Vendor", vendor = "Dedric Sleetshaper", x = 25, y = 42, zone = "Ironforge", mapID = 87 },

    ["Dark Obelisk"] = { method = "Reputation", vendor = "Rae'ana", x = 47.8, y = 82, zone = "Silvermoon City", mapID = 2022 },
    ["Dark Ship's Lantern"] = { method = "Quest", vendor = "Halenthos Brightstride", x = 67.5, y = 33.9, zone = "Dalaran (Legion)", mapID = 627 },
    ["Dark Talon Pennant"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Dark Void Inkwell"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Dazar'alor Forge"] = { method = "Achievement", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Dazar'alor Market Tent"] = { method = "Reputation", vendor = "Provisioner Lija", x = 39, y = 79.4, zone = "Nazmir", mapID = 863 },

    ["Deactivated K'areshi Warp Cannon"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, Veiled Market", mapID = 2472 },
    ["Decorated Underground Table"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Decorative Cinder Honeypot"] = { method = "Vendor", vendor = "Cendvin", x = 74.35, y = 45.29, zone = "Isle of Dorn", mapID = 2248 },

    ["Decorative Dornogal Opal"] = { method = "Vendor", vendor = "Disguised Decor Duel Vendor", x = 31.7, y = 76.9, zone = "Silvermoon City", mapID = 2393 },

    ["Deephaul Crystal"] = { method = "Achievement", vendor = "Velerd", x = 55.4, y = 76.8, zone = "Dornogal", mapID = 2339 },

    ["Deluxe Suramar Sleeper"] = { method = "Achievement", vendor = "Jocenna", x = 49.6, y = 62.8, zone = "Suramar", mapID = 680 },

    ["Deluxe Val'sharah Bed"] = { method = "Achievement", vendor = "Selfira Ambergrove", x = 54.2, y = 72.4, zone = "Val'sharah", mapID = 641 },

    ["Delver's Bountiful Coffer"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, mapID = 2393 },
    ["Demonic Storage Chest"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Depthdiver's Cooking Spit"] = { method = "Vendor", vendor = "Depthdiver Tu'nakit", x = 68.2, y = 20.2, zone = "Zul'Aman", mapID = 2437 },

    ["Devastor's Brazier"] = { method = "Vendor", vendor = "Tethalash", x = 25.6, y = 33.8, zone = "Valdrakken", mapID = 2112 },

    ["Diamond Honor Stone"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Dilapidated Wildhammer Well"] = { method = "Quest", vendor = "Breana Bitterbrand", x = 49.6, y = 29.6, zone = "Twilight Highlands", mapID = 241 },


    -- Fifth research batch (worldofhousing.io catalogue, page 9).
    ["Dornogal Brazier"] = { method = "Achievement", vendor = "Garnett", x = 54.6, y = 57.2, zone = "Dornogal", mapID = 2339 },

    ["Dornogal Hanging Lantern"] = { method = "Quest", vendor = "Garnett", x = 54.6, y = 57.2, zone = "Dornogal", mapID = 2339 },

    ["Double-Sprocket Table"] = { method = "Quest", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Draconic Auctioneer's Lectern"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Draconic Crafter's Forge"] = { method = "Quest", vendor = "Provisioner Thom", x = 36.6, y = 50.6, zone = "Valdrakken", mapID = 2112 },

    ["Draconic Crafter's Table"] = { method = "Vendor", vendor = "Tethalash", x = 25.6, y = 33.8, zone = "Valdrakken", mapID = 2112 },

    ["Draconic Memorial Stone"] = { method = "Quest", vendor = "Silvrath", x = 71.8, y = 49.6, zone = "Valdrakken", mapID = 2134 },

    ["Draconic Metalshaper's Anvil"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Draconic Sconce"] = { method = "Vendor", vendor = "Second Chair Pawdo", x = 52.96, y = 68.12, zone = "Orgrimmar, Dornogal, Stormwind City", mapID = 2339 },
    ["Draconic Stone Table"] = { method = "Reputation", vendor = "Unatos", x = 58.05, y = 35.30, zone = "Valdrakken", mapID = 2112 },

    ["Draconic Trader's Cart"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Draenei Farmer's Trellis"] = { method = "Quest", zone = "Shadowmoon Valley" },
    ["Draenethyst Lamppost"] = { method = "Quest", vendor = "Trader Caerel", x = 41.6, y = 59.6, zone = "Stormshield", mapID = 622 },

    ["Draenethyst Lantern"] = { method = "Reputation", vendor = "Vindicator Nuurem", zone = "Stormshield", x = 46.34, y = 76.55, mapID = 622 },

    ["Draenic Bookcase"] = { method = "Quest", vendor = "Toraan the Revered", x = 67.6, y = 55.8, zone = "Krokuun", mapID = 940 },
    ["Draenic Fence"] = { method = "Quest", vendor = "Trader Caerel", x = 41.6, y = 59.6, zone = "Stormshield", mapID = 622 },

    ["Draenic Fencepost"] = { method = "Quest", vendor = "Trader Caerel", x = 41.6, y = 59.6, zone = "Stormshield", mapID = 622 },

    ["Draenic Forge"] = { method = "Quest", vendor = "Trader Caerel", x = 41.6, y = 59.6, zone = "Stormshield", mapID = 622 },

    ["Draenic Ottoman"] = { method = "Drop", zone = "Auchindoun" },
    ["Draenic Storage Chest"] = { method = "Reputation", vendor = "Maaria", x = 33.5, y = 49.7, zone = "Lunarfall", mapID = 582 },

    ["Draenic Wooden Table"] = { method = "Quest", vendor = "Trader Caerel", x = 41.6, y = 59.6, zone = "Stormshield", mapID = 622 },

    ["Draenic Wooden Wall Shelf"] = { method = "Quest", vendor = "Toraan the Revered", x = 67.6, y = 55.8, zone = "Krokuun", mapID = 940 },
    ["Draenor Cookpot"] = { method = "Reputation", vendor = "Kil'rip", x = 51.5, y = 60.5, zone = "Frostfire Ridge" },
    ["Dragon's Grand Mirror"] = { method = "Reputation", vendor = "Silvrath", x = 71.8, y = 49.6, zone = "Valdrakken", mapID = 2134 },

    ["Dragon's Hoard Chest"] = { method = "Achievement", vendor = "Jolinth", x = 35.2, y = 56.8, zone = "The Forbidden Reach", mapID = 2151 },

    ["Drained Dark Heart of Galakrond"] = { method = "Achievement", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Dreadscar Battle Planning Map"] = { method = "Achievement", vendor = "Gigi Gigavoid", x = 58.5, y = 33.4, zone = "Dreadscar Rift", mapID = 1107 },

    ["Dreadscar Bookcase"] = { method = "Vendor", vendor = "Gigi Gigavoid", x = 58.5, y = 33.4, zone = "Dreadscar Rift", mapID = 1107 },


    -- Sixth research batch (worldofhousing.io catalogue, page 10).
    ["Dreadscar Dais"] = { method = "Achievement", vendor = "Gigi Gigavoid", x = 58.5, y = 33.4, zone = "Dreadscar Rift", mapID = 1107 },

    ["Dreamrift Vanquisher's Argent Trophy"] = { method = "Drop", zone = "The Dreamrift" },
    ["Dreamweaver Banner"] = { method = "Vendor", vendor = "Amurra Thistledew", x = 40.2, y = 21.0, zone = "The Dreamgrove", mapID = 747 },

    ["Dried Gilnean Roses"] = { method = "Vendor", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Dried Whitewash Corn"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Driftwood Barrel"] = { method = "Quest", vendor = "Crafty Palu", x = 41.6, y = 10.6, zone = "Highmountain", mapID = 650 },

    ["Driftwood Junk Pile"] = { method = "Quest", vendor = "Crafty Palu", x = 41.6, y = 10.6, zone = "Highmountain", mapID = 650 },

    ["Dry Razorwind Grass Patch"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Dual Mechanical Gauge"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Dual-Action Turbo Pro Lever"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Durable Folk Valance"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Durable Hex Table"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Durable Wooden Chest"] = { method = "Quest", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Duskberry Bush"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Duskwood Shadebrush"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Duskwood Sycamore Shrub"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Earthen Chain Wall Shelf"] = { method = "Vendor", vendor = "Waxmonger Squick", x = 47.3, y = 32.6, zone = "The Ringing Deeps", mapID = 2214 },

    ["Earthen Contender's Target"] = { method = "Achievement", vendor = "Velerd", x = 55.4, y = 76.8, zone = "Dornogal", mapID = 2339 },

    ["Earthen Etched Throne"] = { method = "Quest", vendor = "Chert", x = 43.2, y = 32.8, zone = "The Ringing Deeps", mapID = 2214 },

    ["Earthen Ring Scouting Map"] = { method = "Achievement", vendor = "Flamesmith Lanying", x = 30.5, y = 60.2, zone = "The Maelstrom", mapID = 726 },

    ["Earthen Storage Crate"] = { method = "Quest", vendor = "Auditor Balwurz", x = 39.2, y = 24.32, zone = "Dornogal", mapID = 2339 },

    ["Earthhide Amani Tapestry"] = { method = "Quest", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Ebon Blade Banner"] = { method = "Vendor", vendor = "Quartermaster Ozorg", x = 99.4, y = 57.2, zone = "Broken Shore" },
    ["Ebon Blade Planning Map"] = { method = "Achievement", vendor = "Quartermaster Ozorg", x = 99.4, y = 57.2, zone = "Broken Shore" },
    ["Ebon Blade Tome"] = { method = "Vendor", vendor = "Quartermaster Ozorg", x = 99.4, y = 57.2, zone = "Broken Shore" },
    ["Ebon Blade Weapon Rack"] = { method = "Achievement", vendor = "Quartermaster Ozorg", x = 99.4, y = 57.2, zone = "Broken Shore" },
    ["Eerie Iridescent Riftshroom"] = { method = "Drop", zone = "The Dreamrift" },
    ["Elaborate Suramar Window"] = { method = "Quest", vendor = "Jocenna", x = 49.6, y = 62.8, zone = "Suramar", mapID = 680 },

    ["Elegant Almond Table"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Carved Bench"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Carved Door"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Covered Bench"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Curved Table"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Dracthyr's Tea Cup"] = { method = "Quest", vendor = "Silvrath", x = 71.8, y = 49.6, zone = "Valdrakken", mapID = 2134 },

    ["Elegant Dracthyr's Tea Set"] = { method = "Quest", vendor = "Silvrath", x = 71.8, y = 49.6, zone = "Valdrakken", mapID = 2134 },

    ["Elegant Elven Barrel"] = { method = "Vendor", vendor = "Argan Hammerfist", x = 52.2, y = 37.8, zone = "Founder's Point", mapID = 2352 },

    ["Elegant Elven Bathtub"] = { method = "Drop", zone = "Eversong Woods" },
    ["Elegant Elven Canopy Bed"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Elven Chandelier"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Elven Desk"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },


    -- Seventh research batch (worldofhousing.io catalogue, page 11).
    ["Elegant Padded Chaise"] = { method = "Quest", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Pillow Roll"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Table Lamp"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Tied Curtain"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Wall Drape"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Elegant Wooden Dresser"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Elemental Altar of the Maelstrom"] = { method = "Achievement", vendor = "Flamesmith Lanying", x = 30.5, y = 60.2, zone = "The Maelstrom", mapID = 726 },

    ["Elodor Armory Rack"] = { method = "Reputation", vendor = "Vindicator Nuurem", zone = "Stormshield", x = 46.34, y = 76.55, mapID = 622 },

    ["Elodor Barrel"] = { method = "Quest", zone = "Shadowmoon Valley" },
    ["Elven Floral Window"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Elven Round Table"] = { method = "Quest", vendor = "Sileas Duskvine", x = 26.2, y = 32.2, zone = "Suramar", mapID = 680 },

    ["Elven Temple Brazier"] = { method = "Drop", zone = "Darkshore" },
    ["Elven Wood Crate"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Elven Woodvine Trellis"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Elwynn Apple Tree"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Elwynn Autumn Apple Tree"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Elwynn Cobblestone"] = { method = "Vendor", vendor = "\"Yen\" Malone", x = 40.2, y = 73.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Elwynn Cobblestone Cluster"] = { method = "Vendor", vendor = "\"Yen\" Malone", x = 40.2, y = 73.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Elwynn Cobblestone Pair"] = { method = "Vendor", vendor = "\"Yen\" Malone", x = 40.2, y = 73.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Elwynn Cobblestone Round"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Elwynn Fence"] = { method = "Reputation", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Elwynn Fencepost"] = { method = "Reputation", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Elwynn Grass Patch"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Elwynn Grass Spread"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Elwynn Small Grass Patch"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Elwynn Whitebrush"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Embellished Dwarven Tome"] = { method = "Reputation", vendor = "Breana Bitterbrand", x = 49.6, y = 29.6, zone = "Twilight Highlands", mapID = 241 },

    ["Emblem of the Naaru's Blessing"] = { method = "Quest", vendor = "Trader Caerel", x = 41.6, y = 59.6, zone = "Stormshield", mapID = 622 },

    ["Embroidered Embaari Tent"] = { method = "Reputation", vendor = "Vindicator Nuurem", zone = "Stormshield", x = 46.34, y = 76.55, mapID = 622 },

    ["Emergency Warning Lamp"] = { method = "Reputation", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Empty Amani Cauldron"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Empty Consortium Energy Barrel"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Empty Consortium Energy Crate"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Empty Lorewalker's Bookcase"] = { method = "Reputation", vendor = "Tan Shin Tiao", x = 82.2, y = 29.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Empty Orgrimmar Bathtub"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Empty Stormwind Market Stand"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },


    -- Eighth research batch (worldofhousing.io catalogue, page 12).
    ["Empty Wicker Basket"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Empty Wooden Bathtub"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Enchanted Blood Elven Candelabra"] = { method = "Vendor", vendor = "Dethelin", x = 52.5, y = 47.5, zone = "Silvermoon City", mapID = 2393 },

    ["Eredar Lord's Fel Torch"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Ethereal Pipe Segment"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["Eversong Crystal Glass"] = { method = "Vendor", vendor = "Hesta Forlath", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Eversong Dessert Platter"] = { method = "Achievement", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Eversong Feast Platter"] = { method = "Achievement", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Eversong Party Platter"] = { method = "Quest", zone = "Dalaran" },
    ["Evoker's Elegant Rug"] = { method = "Vendor", vendor = "Tethalash", x = 25.6, y = 33.8, zone = "Valdrakken", mapID = 2112 },

    ["Exposed Angled Ethereal Pipe"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["Exposed Corner Ethereal Pipe"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["Exposed Intersecting Ethereal Pipe"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["Exposed Long Ethereal Pipe"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["Eye of Acherus"] = { method = "Drop", zone = "Pit of Saron" },
    ["Fallside Lantern"] = { method = "Quest", vendor = "Garnett", x = 54.6, y = 57.2, zone = "Dornogal", mapID = 2339 },

    ["Fallside Storage Tent"] = { method = "Achievement", vendor = "Garnett", x = 54.6, y = 57.2, zone = "Dornogal", mapID = 2339 },

    ["Farstrider's Comfy Cushion"] = { method = "Reputation", vendor = "Ranger Allorn", x = 43.45, y = 47.56, zone = "Eversong Woods", mapID = 2395 },

    ["Fel Fountain"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Fel Hammer Scouting Map"] = { method = "Achievement", vendor = "Falara Nightsong", x = 59.6, y = 45, zone = "Mardum, the Shattered Abyss" },
    ["Filigree Moon Lamp"] = { method = "Vendor", vendor = "Second Chair Pawdo", x = 52.96, y = 68.12, zone = "Orgrimmar, Dornogal, Stormwind City", mapID = 2339 },
    ["Filigree Moon Sconce"] = { method = "Drop", zone = "Darkshore" },
    ["Firm Haranir Pillow"] = { method = "Vendor", vendor = "Mothkeeper Wew'tam", x = 49.28, y = 54.35, zone = "Harandar", mapID = 2413 },

    ["Five Dawns Planning Table"] = { method = "Achievement", vendor = "Caydori Brightstar", x = 50.5, y = 59.0, zone = "The Wandering Isle", mapID = 709 },

    ["Five Dawns Shrine of the Smoking Fish"] = { method = "Vendor", vendor = "Caydori Brightstar", x = 50.5, y = 59.0, zone = "The Wandering Isle", mapID = 709 },

    ["Five Dawns Weapon Rack"] = { method = "Vendor", vendor = "Caydori Brightstar", x = 50.5, y = 59.0, zone = "The Wandering Isle", mapID = 709 },

    ["Flat Boulder"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Floating Azure Lantern"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Floating Spire Shelf"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Flowering Durotar Cactus"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Forbidden Fork"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", mapID = 2352 },


    -- Ninth research batch (worldofhousing.io catalogue, page 13).
    ["Forsaken Long Table"] = { method = "Quest", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Forsaken Round Rug"] = { method = "Vendor", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Forsaken Spiked Brazier"] = { method = "Drop", zone = "Darkshore" },
    ["Forsaken Spiked Chair"] = { method = "Quest", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Forsaken Studded Table"] = { method = "Quest", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Forsaken War Planning Table"] = { method = "Vendor", vendor = "Provisioner Mukra", x = 51.2, y = 95.2, zone = "Dazar'alor", mapID = 1165 },

    ["Fortified Alliance Banner"] = { method = "Achievement", vendor = "Riica", zone = "Stormwind City", x = 77.8, y = 65.6, mapID = 84 },

    ["Fortified Horde Banner"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Founder's Point Apple Tree"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Autumn Apple Tree"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Blooming Grass Patch"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Large Garden Cluster"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Fresh Canvas"] = { method = "Vendor", vendor = "Hesta Forlath", x = 44.2, y = 62.7, zone = "Silvermoon City", mapID = 2393 },

    ["Freywold Bench"] = { method = "Quest", vendor = "Cinnabar", x = 42, y = 73, zone = "Isle of Dorn", mapID = 2248 },

    ["Freywold Fountain"] = { method = "Quest", vendor = "Cinnabar", x = 42, y = 73, zone = "Isle of Dorn", mapID = 2248 },

    ["Freywold Seat"] = { method = "Quest", vendor = "Cinnabar", x = 42, y = 73, zone = "Isle of Dorn", mapID = 2248 },

    ["Frostwolf Axe-Dart Board"] = { method = "Vendor", vendor = "Krixel Pinchwhistle", x = 44.9, y = 14.7, zone = "Frostwall" },
    ["Frostwolf Banded Stool"] = { method = "Vendor", vendor = "Krixel Pinchwhistle", x = 44.9, y = 14.7, zone = "Frostwall" },
    ["Frostwolf Bookcase"] = { method = "Vendor", vendor = "Sergeant Grimjaw", x = 43.8, y = 47.4, zone = "Frostwall", mapID = 590 },

    ["Frostwolf Round Table"] = { method = "Vendor", vendor = "Sergeant Grimjaw", x = 43.8, y = 47.4, zone = "Frostwall", mapID = 590 },

    ["Fungal Chest"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, mapID = 2393 },
    ["Fungal Pergola"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Fungarian Vine Fence"] = { method = "Achievement", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },


    -- Tenth research batch (worldofhousing.io catalogue, page 14).
    ["Galactic Commander's Orb"] = { method = "Reputation", vendor = "Thraxadar", x = 39.33, y = 80.96, zone = "Voidstorm", mapID = 2444 },
    ["Galactic Void-Scarred Barricade"] = { method = "Reputation", vendor = "Thraxadar", x = 39.33, y = 80.96, zone = "Voidstorm", mapID = 2444 },
    ["Gallagio L.U.C.K. Spinner"] = { method = "Achievement", vendor = "Ando the Gat", x = 48.1, y = 56.7, zone = "Liberation of Undermine (raid)" },
    ["Galvanic Storage and Maintenance Device"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Gemmed Elven Chest"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Gemmed Eversong Lantern"] = { method = "Drop", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Gentle Floating Planter"] = { method = "Reputation", vendor = "Apprentice Diell", x = 43.52, y = 47.52, zone = "Eversong Woods", mapID = 2395 },

    ["Gift of Gilneas"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Gilded Eversong Cup"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Gilded Lightwood Wardrobe"] = { method = "Reputation", vendor = "Ranger Allorn", x = 43.45, y = 47.56, zone = "Eversong Woods", mapID = 2395 },

    ["Gilded Oaks Large Garden Cluster"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Gilded Sky-Blue Drapery"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Gilded Sunfury Chair"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Gilded Vigil Post"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Gilnean Banded Crate"] = { method = "Quest", vendor = "Willard Harrington", x = 61.6, y = 25.8 },
    ["Gilnean Bench"] = { method = "Vendor", vendor = "Samantha Buckley", x = 65.2, y = 47.2, zone = "Ruins of Gilneas City", mapID = 218 },
    ["Gilnean Celebration Keg"] = { method = "Achievement", vendor = "Samantha Buckley", x = 65.2, y = 47.2, zone = "Ruins of Gilneas City", mapID = 218 },
    ["Gilnean Circular Rug"] = { method = "Drop", vendor = "Lord Godfrey", zone = "Shadowfang Keep" },
    ["Gilnean Noble's Trellis"] = { method = "Reputation", vendor = "Lord Candren", x = 37, y = 47.8, zone = "Stormwind City", mapID = 89 },
    ["Gilnean Stocks"] = { method = "Vendor", vendor = "Samantha Buckley", x = 65.2, y = 47.2, zone = "Ruins of Gilneas City", mapID = 218 },
    ["Gilnean Stone Wall"] = { method = "Reputation", vendor = "Lord Candren", x = 37, y = 47.8, zone = "Stormwind City", mapID = 89 },
    ["Gilnean Washing Line"] = { method = "Vendor", vendor = "Samantha Buckley", x = 65.2, y = 47.2, zone = "Ruins of Gilneas City", mapID = 218 },
    ["Gilnean Wooden Bed"] = { method = "Vendor", vendor = "Samantha Buckley", x = 65.2, y = 47.2, zone = "Ruins of Gilneas City", mapID = 218 },
    ["Gloomrose"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Glorious Pendant of Rukhmar"] = { method = "Achievement", vendor = "Ruuan the Seer", x = 46.6, y = 45, zone = "Spires of Arak", mapID = 542 },


    -- Eleventh research batch (worldofhousing.io catalogue, page 15).
    ["Gnomish Cog Stack"] = { method = "Achievement", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Gnomish Safety Flamethrower"] = { method = "Reputation", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Gnomish Sprocket Table"] = { method = "Quest", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Gnomish T.O.O.L.B.O.X."] = { method = "Achievement", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Gnomish Tesla Coil"] = { method = "Quest", vendor = "Second Chair Pawdo", x = 52.96, y = 68.12, zone = "Orgrimmar, Dornogal, Stormwind City", mapID = 2339 },
    ["Gnomish Tesla Tower"] = { method = "Drop", zone = "Mechagon" },
    ["Gob-chanical Trash Heap"] = { method = "Quest", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Golden Cloud Serpent Treasure Chest"] = { method = "Vendor", vendor = "Second Chair Pawdo", x = 52.96, y = 68.12, zone = "Orgrimmar, Dornogal, Stormwind City", mapID = 2339 },
    ["Golden Loa's Altar"] = { method = "Achievement", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Golden Pandaren Privacy Screen"] = { method = "Quest", vendor = "Sage Whiteheart", x = 84.62, y = 63.81, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Golden Zandalari Bed"] = { method = "Quest", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Goldenmist Grapes"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Goldshire Food Cart"] = { method = "Achievement", vendor = "Fiona", x = 67.87, y = 41.27, zone = "Boralus", mapID = 1161 },
    ["Goldshire Wardrobe"] = { method = "Quest", vendor = "Maybell Maclure-Stonefield", x = 41.2, y = 43.6, zone = "Lunarfall", mapID = 582 },

    ["Goldshire Window"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Gooey Niffen Jar"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Grand Aethercharged Crystal"] = { method = "Quest", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Grand Draenethyst Lamp"] = { method = "Reputation", vendor = "Vindicator Nuurem", zone = "Stormshield", x = 46.34, y = 76.55, mapID = 622 },

    ["Grand Elven Bench"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Grand Elven Bookcase"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Grand Elven Wall Curtain"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Grand Lightwood Table"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Grand Mask of Bwonsamdi"] = { method = "Achievement", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Green Boralus Market Tent"] = { method = "Quest", vendor = "Pearl Barlow", x = 70.8, y = 15.8, zone = "Boralus", mapID = 1161 },

    ["Green Thumb's Watering Can"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Greenvine Amani Tapestry"] = { method = "Quest", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Grummle Bedroll"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Grummle Kafa Refinery"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Grummle Sleeping Bag"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Grummle Tent"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Gryphon Roost"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Guardian's Empowerment"] = { method = "Achievement", vendor = "Joruh", x = 38.8, y = 71.9, zone = "Orgrimmar", mapID = 85 },

    ["Gundargaz Grand Keg"] = { method = "Quest", vendor = "Chert", x = 43.2, y = 32.8, zone = "The Ringing Deeps", mapID = 2214 },


    -- Twelfth research batch (worldofhousing.io catalogue, page 16).
    ["Hanging Arrow Kite"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Hanging Draenethyst Light"] = { method = "Quest", vendor = "Trader Caerel", x = 41.6, y = 59.6, zone = "Stormshield", mapID = 622 },

    ["Hanging Felsteel Cage"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Hanging Felsteel Chain"] = { method = "Vendor", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Harandar Anvil"] = { method = "Vendor", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Harandar Charcuterie Board"] = { method = "Vendor", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Harandar Glowvine Lantern"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Harandar Runestone"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Haranir Herb Rack"] = { method = "Reputation", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },

    ["Haranir Reclined Bed"] = { method = "Vendor", vendor = "Mothkeeper Wew'tam", x = 49.28, y = 54.35, zone = "Harandar", mapID = 2413 },

    ["Haranir Whistling Arrow"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Hardy Razorwind Grass Patch"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Hash'ey Heartbroth Cauldron"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Head of the Broodmother"] = { method = "Achievement", vendor = "Axle", x = 41.9, y = 73.9, zone = "Onyxia's Lair", mapID = 70 },
    ["Healer's Empowerment"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Hearthlight Armillary"] = { method = "Vendor", vendor = "The Last Architect", x = 52.6, y = 37.5, zone = "Founder's Point", hordeVendor = "The Last Architect", hordeZone = "Razorwind Shores", hordeX = 53.6, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Hearty Niffen Grub"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Hide-Covered Bench"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Hide-Covered Wall Shelf"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["High Arakkoan Alchemist's Shelf"] = { method = "Reputation", vendor = "Shadow-Sage Brakoss", x = 45.8, y = 74.8, zone = "Stormshield", mapID = 622 },

    ["High Arakkoan Library Shelf"] = { method = "Quest", vendor = "Ruuan the Seer", x = 46.6, y = 45, zone = "Spires of Arak", mapID = 542 },

    ["High Arakkoan Shelf"] = { method = "Reputation", vendor = "Shadow-Sage Brakoss", x = 45.8, y = 74.8, zone = "Stormshield", mapID = 622 },

    ["High-Backed Orgrimmar Chair"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Highmountain Totem"] = { method = "Reputation", vendor = "Ransa Greyfeather", x = 37.98, y = 46.13, zone = "Thunder Totem", mapID = 750 },

    ["Hilltop Boulder"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Hollowed Harandar Gourds"] = { method = "Reputation", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },


    -- Thirteenth research batch (worldofhousing.io catalogue, page 17).
    ["Homestone Doormat"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Hooded Iron Lantern"] = { method = "Quest", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Horde Battle Emblem"] = { method = "Drop", vendor = "Warlord Zaela", zone = "Upper Blackrock Spire" },
    ["Horde Battlefield Banner"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Horde Dueling Flag"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Horde Warlord's Throne"] = { method = "Drop", vendor = "Garrosh Hellscream", zone = "Siege of Orgrimmar" },
    ["Horned Banded Barrel"] = { method = "Quest", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Horned Hanging Sconce"] = { method = "Quest", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Hull'n'Home Chair"] = { method = "Vendor", vendor = "Janey Forrest", x = 56.16, y = 46.02, zone = "Boralus", mapID = 1161 },
    ["Hull'n'Home Dresser"] = { method = "Vendor", vendor = "Janey Forrest", x = 56.16, y = 46.02, zone = "Boralus", mapID = 1161 },
    ["Hull'n'Home Window"] = { method = "Vendor", vendor = "Janey Forrest", x = 56.16, y = 46.02, zone = "Boralus", mapID = 1161 },
    ["Hyjal Climbing Vine"] = { method = "Quest", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Idol of Pa'ku, Master of Winds"] = { method = "Achievement", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Idol of Rezan, Loa of Kings"] = { method = "Quest", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Illicit Long Table"] = { method = "Drop", zone = "Murder Row" },
    ["Illidari Banner"] = { method = "Vendor", vendor = "Falara Nightsong", x = 59.6, y = 45, zone = "Mardum, the Shattered Abyss" },
    ["Illidari Glaiverest"] = { method = "Achievement", vendor = "Falara Nightsong", x = 59.6, y = 45, zone = "Mardum, the Shattered Abyss" },
    ["Illidari Skull Sentinel"] = { method = "Vendor", vendor = "Falara Nightsong", x = 59.6, y = 45, zone = "Mardum, the Shattered Abyss" },
    ["Illidari Tent"] = { method = "Vendor", vendor = "Falara Nightsong", x = 59.6, y = 45, zone = "Mardum, the Shattered Abyss" },
    ["Imperator's Torment Crystal"] = { method = "Drop", zone = "The Voidspire" },
    ["Inactive Filigree Moon Lamp"] = { method = "Quest", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Incontinental Table Lamp"] = { method = "Vendor", vendor = "Rocco Razzboom", x = 39, y = 22, zone = "Undermine", mapID = 2346 },

    ["Ineffective Mechanical Privacy Screen"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Inert Blight Canister"] = { method = "Vendor", vendor = "Provisioner Mukra", x = 51.2, y = 95.2, zone = "Dazar'alor", mapID = 1165 },

    ["Iron Chain Chandelier"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Iron Dragonmaw Gate"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Iron-Reinforced Crate"] = { method = "Quest", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Iron-Reinforced Cupboard"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Iron-Reinforced Door"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Iron-Reinforced Standing Mirror"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Iron-Reinforced Wooden Rack"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Iron-Reinforced Wooden Window"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Iron-Studded Wooden Window"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Ironforge Bookcase"] = { method = "Vendor", vendor = "Inge Brightview", x = 76.13, y = 8.09, zone = "Ironforge", mapID = 87 },

    ["Ironforge Fence"] = { method = "Reputation", vendor = "Dedric Sleetshaper", x = 25, y = 42, zone = "Ironforge", mapID = 87 },

    ["Ironforge Fencepost"] = { method = "Reputation", vendor = "Dedric Sleetshaper", x = 25, y = 42, zone = "Ironforge", mapID = 87 },

    ["Jagged Orgrimmar Trellis"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Jewelcrafter's Tent"] = { method = "Quest", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },


    -- Fourteenth research batch (worldofhousing.io catalogue, page 18).
    ["Jury-Rigged Electrical Couple"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["K'areshi Holo-Crystal Projector"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["K'areshi Incense Burner"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["K'areshi Protectorate Portal"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["K'areshi Warp Platform"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["Kafa Creamer"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Kafa Press"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Kaheti Scribe's Records"] = { method = "Achievement", vendor = "Thripps", x = 50.2, y = 31.4, zone = "City of Threads", mapID = 2213 },

    ["Kaldorei Chef's Table"] = { method = "Vendor", vendor = "Hilseth Travelstride", x = 57.2, y = 76.5, zone = "Val'sharah", mapID = 641 },

    ["Kaldorei Cushioned Seat"] = { method = "Quest", vendor = "Selfira Ambergrove", x = 54.2, y = 72.4, zone = "Val'sharah", mapID = 641 },

    ["Kaldorei Desk"] = { method = "Vendor", vendor = "Hilseth Travelstride", x = 57.2, y = 76.5, zone = "Val'sharah", mapID = 641 },

    ["Kaldorei Stone Fence"] = { method = "Quest", vendor = "Myria Glenbrook", x = 60, y = 84.8, zone = "Val'sharah", mapID = 641 },

    ["Kaldorei Stone Fencepost"] = { method = "Vendor", vendor = "Myria Glenbrook", x = 60, y = 84.8, zone = "Val'sharah", mapID = 641 },

    ["Kaldorei Treasure Trove"] = { method = "Achievement", vendor = "Selfira Ambergrove", x = 54.2, y = 72.4, zone = "Val'sharah", mapID = 641 },

    ["Kaldorei Wall Shelf"] = { method = "Quest", vendor = "Selfira Ambergrove", x = 54.2, y = 72.4, zone = "Val'sharah", mapID = 641 },

    ["Kaldorei Washbasin"] = { method = "Reputation", vendor = "Sylvia Hartshorn", x = 54.70, y = 73.25, zone = "Val'sharah", mapID = 641 },

    ["Kharanos Stone Bed"] = { method = "Vendor", vendor = "Innkeeper Belm", x = 54.07, y = 50.76, zone = "Dun Morogh", mapID = 27 },

    ["Kilnmaster's Bucket"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Kobold Candle Trio"] = { method = "Quest", vendor = "Gabbun", x = 43.4, y = 33.2, zone = "The Ringing Deeps", mapID = 2214 },

    ["Kobold Digger's Chair"] = { method = "Quest", vendor = "Gabbun", x = 43.4, y = 33.2, zone = "The Ringing Deeps", mapID = 2214 },

    ["Kobold Treasure Pile"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Kobold Wagon"] = { method = "Quest", vendor = "Gabbun", x = 43.4, y = 33.2, zone = "The Ringing Deeps", mapID = 2214 },

    ["Kotmogu Orb of Power"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Kotmogu Pedestal"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Kun-Lai Lacquered Rickshaw"] = { method = "Quest", vendor = "Brother Furtrim", x = 57.2, y = 61, zone = "Kun-Lai Summit", mapID = 379 },

    ["Large Brazier of Elune"] = { method = "Quest", vendor = "Moon Priestess Lasara", x = 46.6, y = 70.6, zone = "Amirdrassil", mapID = 2239 },
    ["Large Covered Wooden Table"] = { method = "Quest", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Large Dangling Cobweb"] = { method = "Vendor", vendor = "Klasa", x = 58.2, y = 61.6, zone = "Founder's Point", mapID = 2352 },

    ["Large Forsaken Spiked Brazier"] = { method = "Vendor", vendor = "Provisioner Mukra", x = 51.2, y = 95.2, zone = "Dazar'alor", mapID = 1165 },

    ["Large Forsaken War Tent"] = { method = "Achievement", vendor = "Provisioner Mukra", x = 51.2, y = 95.2, zone = "Dazar'alor", mapID = 1165 },

    ["Large H.O.M.E. Cog"] = { method = "Reputation", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },


    -- Fifteenth research batch (worldofhousing.io catalogue, page 19).
    ["Large Highmountain Drum"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Large Hull'n'Home Table"] = { method = "Vendor", vendor = "Janey Forrest", x = 56.16, y = 46.02, zone = "Boralus", mapID = 1161 },
    ["Large Karabor Fountain"] = { method = "Quest", vendor = "Trader Caerel", x = 41.6, y = 59.6, zone = "Stormshield", mapID = 622 },

    ["Large Legion Candle"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Large Orgrimmar Bookcase"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Large Razorwind Gazebo"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Large Stonework Fountain"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Large Sturdy Wooden Table"] = { method = "Quest", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Large Traditional Shal'dorei Rug"] = { method = "Vendor", vendor = "Leyweaver Inondra", x = 40.62, y = 69.53, zone = "Suramar", mapID = 680 },

    ["Leather Valance"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Leather-Banded Wooden Bench"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Leftover Undermine Takeout"] = { method = "Vendor", vendor = "Street Food Vendor", x = 26.0, y = 43.0, zone = "Undermine", mapID = 2346 },

    ["Legerdemain Lounge Sign Board"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Legion Torture Rack"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Legion's Fel Brazier"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Legion's Fel Torch"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Legion's Holo-Communicator"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Light-Infused Fountain"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon", mapID = 2393 },
    ["Light-Infused Rotunda"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon", mapID = 2393 },
    ["Lightbloom Moss Mound"] = { method = "Achievement", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Literature of Dornogal"] = { method = "Reputation", vendor = "Auditor Balwurz", x = 39.2, y = 24.32, zone = "Dornogal", mapID = 2339 },

    ["Literature of Gundargaz"] = { method = "Reputation", vendor = "Auditor Balwurz", x = 39.2, y = 24.32, zone = "Dornogal", mapID = 2339 },

    ["Literature of Taelloch"] = { method = "Reputation", vendor = "Auditor Balwurz", x = 39.2, y = 24.32, zone = "Dornogal", mapID = 2339 },

    ["Little Wolf's Loo"] = { method = "Quest", vendor = "Lord Candren", x = 37, y = 47.8, zone = "Stormwind City", mapID = 89 },
    ["Lively Pistons"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Lively Songwriter's Quill"] = { method = "Drop", zone = "Eversong Woods" },
    ["Loamm Archway"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Loamm Bartering Stall"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Loamm Wheelpot"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Loammy Soil"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Logger's Picnic Table"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Long Durable Table"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Long Ethereal Pipe Segment"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },

    -- Sixteenth research batch (worldofhousing.io catalogue, page 20).
    ["Long Leather-Clad Table"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Long Orgrimmar Bench"] = { method = "Quest", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Long Silvermoon Table"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Long Sin'dorei Rug"] = { method = "Vendor", vendor = "Rae'ana", x = 47.8, y = 82, zone = "The Waking Shores", mapID = 2022 },
    ["Lordaeron Banded Barrel"] = { method = "Achievement", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Lordaeron Banded Crate"] = { method = "Achievement", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Lordaeron Fence"] = { method = "Quest", vendor = "Captain Donald Adams", x = 63.6, y = 48.8, zone = "Orgrimmar", mapID = 85 },

    ["Lordaeron Fencepost"] = { method = "Quest", vendor = "Captain Donald Adams", x = 63.6, y = 48.8, zone = "Orgrimmar", mapID = 85 },

    ["Lordaeron Hanging Lantern"] = { method = "Quest", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Lordaeron Lantern"] = { method = "Quest", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Lordaeron Rectangular Rug"] = { method = "Achievement", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Lordaeron Sconce"] = { method = "Reputation", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Lordaeron Spiked Weapon Rack"] = { method = "Achievement", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Lordaeron Torch"] = { method = "Reputation", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Lucky Hanging Lantern"] = { method = "Reputation", vendor = "San Redscale", x = 56.6, y = 44.4, zone = "The Jade Forest", mapID = 371 },


    -- Seventeenth research batch (worldofhousing.io catalogue, page 21).
    ["Mad Science Blueprints"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Maelstrom Banner"] = { method = "Vendor", vendor = "Flamesmith Lanying", x = 30.5, y = 60.2, zone = "The Maelstrom", mapID = 726 },

    ["Maelstrom Chimes"] = { method = "Vendor", vendor = "Flamesmith Lanying", x = 30.5, y = 60.2, zone = "The Maelstrom", mapID = 726 },

    ["Maelstrom Lava Lamp"] = { method = "Achievement", vendor = "Flamesmith Lanying", x = 30.5, y = 60.2, zone = "The Maelstrom", mapID = 726 },

    ["Magister's Bookshelf"] = { method = "Drop", vendor = "Degentrius", zone = "Magisters' Terrace" },
    ["Magistrix's Garden Fountain"] = { method = "Drop", vendor = "Spellblade Aluriel", zone = "The Nighthold" },
    ["Majestic Lightwood Table"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Meadery Ochre Window"] = { method = "Drop", zone = "Cinderbrew Meadery" },
    ["Meadery Storage Barrel"] = { method = "Quest", vendor = "Second Chair Pawdo", x = 52.96, y = 68.12, zone = "Orgrimmar, Dornogal, Stormwind City", mapID = 2339 },
    ["Mecha-Storage Mecha-Chest"] = { method = "Reputation", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Mechagon Control Console"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Mechagon Eyelight Lamp"] = { method = "Reputation", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Mechagon Hanging Floodlight"] = { method = "Reputation", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Mechanical Gauge"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", mapID = 2352 },


    -- Eighteenth research batch (worldofhousing.io catalogue, page 22).
    ["Miniature Charging Station"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Miniature Replica Dark Portal"] = { method = "Achievement", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon", mapID = 2393 },
    ["Monastery Gong"] = { method = "Achievement", vendor = "Caydori Brightstar", x = 50.5, y = 59.0, zone = "The Wandering Isle", mapID = 709 },

    ["Moon-Blessed Barrel"] = { method = "Reputation", vendor = "Sylvia Hartshorn", x = 54.70, y = 73.25, zone = "Val'sharah", mapID = 641 },

    ["Moon-Blessed Storage Crate"] = { method = "Drop", zone = "Darkheart Thicket" },
    ["Moonclasp Satchel"] = { method = "Vendor", vendor = "Celestine of the Harvest", zone = "The Waking Shores" , x = 58.4, y = 67.8 },
    ["MOTHER's Titanic Brazier"] = { method = "Achievement", vendor = "MOTHER", x = 48.2, y = 72.4, zone = "Chamber of Heart", mapID = 1473 },

    ["Murder Row Wine Decanter"] = { method = "Reputation", vendor = "Neriv", x = 43.49, y = 47.65, zone = "Eversong Woods", mapID = 2395 },

    ["Murloc Driftwood Hut"] = { method = "Vendor", vendor = "Ahlurglgr", x = 43, y = 13.8, zone = "Borean Tundra", mapID = 114 },

    ["Murloc's Wind Chimes"] = { method = "Achievement", vendor = "Crafty Palu", x = 41.6, y = 10.6, zone = "Highmountain", mapID = 650 },

    ["Mysterious Empowerment"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["N'Zoth's Captured Eye"] = { method = "Vendor", vendor = "MOTHER", x = 48.2, y = 72.4, zone = "Chamber of Heart", mapID = 1473 },

    ["Naaru Crystal Icon"] = { method = "Vendor", vendor = "Artificer Kallaes", x = 46.22, y = 39.28, zone = "Shadowmoon Valley (WoD)", mapID = 539 },
    ["Nagrand Blueberry Bush"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Nesingwary Mounted Elk Head"] = { method = "Achievement", vendor = "Jaquilina Dramet", x = 43.6, y = 23, zone = "Northern Stranglethorn", mapID = 50 },

    ["Nesingwary Mounted Shoveltusk Head"] = { method = "Achievement", vendor = "Purser Boulian", x = 26.8, y = 59.2, zone = "Sholazar Basin", mapID = 119 },

    ["Netherlight Command Map"] = { method = "Achievement", vendor = "Meridelle Lightspark", x = 39.2, y = 24.7, zone = "Netherlight Temple", mapID = 702 },

    ["Netherlight Conclave Banner"] = { method = "Vendor", vendor = "Meridelle Lightspark", x = 39.2, y = 24.7, zone = "Netherlight Temple", mapID = 702 },

    ["Netherlight Conclave Voidwell"] = { method = "Vendor", vendor = "Meridelle Lightspark", x = 39.2, y = 24.7, zone = "Netherlight Temple", mapID = 702 },

    ["Netherlight Lightwell"] = { method = "Vendor", vendor = "Meridelle Lightspark", x = 39.2, y = 24.7, zone = "Netherlight Temple", mapID = 702 },

    ["Netherstorm Battlefield Flag"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Nightborne Bench"] = { method = "Reputation", vendor = "First Arcanist Thalyssra", x = 34.8, y = 48.1, zone = "Suramar", mapID = 680 },

    ["Nightborne Fireplace"] = { method = "Reputation", vendor = "First Arcanist Thalyssra", x = 34.8, y = 48.1, zone = "Suramar", mapID = 680 },

    ["Nightborne Lantern"] = { method = "Vendor", vendor = "First Arcanist Thalyssra", x = 34.8, y = 48.1, zone = "Suramar", mapID = 680 },

    ["Nightborne Merchant's Stall"] = { method = "Quest", vendor = "Jocenna", x = 49.6, y = 62.8, zone = "Suramar", mapID = 680 },

    ["Nightborne Wall Shelf"] = { method = "Reputation", vendor = "First Arcanist Thalyssra", x = 34.8, y = 48.1, zone = "Suramar", mapID = 680 },

    ["Northshire Barrel"] = { method = "Quest", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Northshire Scribe's Desk"] = { method = "Quest", vendor = "Sergeant Crowler", x = 38.33, y = 31.95, zone = "Lunarfall", mapID = 582 },


    -- Nineteenth research batch (worldofhousing.io catalogue, page 23).
    ["Oath Scale"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Obsidian Warder Pennant"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Old Salt's Fireplace"] = { method = "Achievement", vendor = "Pearl Barlow", x = 70.8, y = 15.8, zone = "Boralus", mapID = 1161 },

    ["On'ohia's Call"] = { method = "Achievement", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Open Carved Wooden Crate"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Open Crude Banded Crate"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Open Elegant Elven Barrel"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Open Horned Banded Barrel"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Open Iron-Reinforced Crate"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Open Rust-Plated Storage Crate"] = { method = "Reputation", vendor = "Sitch Lowdown", x = 30.6, y = 38.8, zone = "Undermine", mapID = 2346 },

    ["Open Sack of Roasted Kafa"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Open Spiky Banded Barrel"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Open Sturdy Void Elf Trunk"] = { method = "Quest", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Open Tome of the Dragon's Dedication"] = { method = "Quest", vendor = "Lifecaller Tzadrak", x = 61.8, y = 73.8, zone = "The Waking Shores", mapID = 2022 },

    ["Open Tome of Twilight Nihilism"] = { method = "Vendor", vendor = "Lonalo", x = 58.59, y = 50.36, zone = "Orgrimmar", mapID = 85 },

    ["Open Void Elf Bedroll"] = { method = "Quest", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Open Wooden Coffin"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Open-Air Sturdy Tent"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Opened Domanaar Storage Crate"] = { method = "Achievement", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Orange Suramar Seat Cushion"] = { method = "Reputation", vendor = "Sundries Merchant", x = 50.8, y = 77.8, zone = "Suramar", mapID = 680 },

    ["Orc-Forged Weaponry"] = { method = "Vendor", vendor = "Moz'def", x = 60.0, y = 50.4, zone = "Frostfire Ridge" },
    ["Orcish Communal Stove"] = { method = "Vendor", vendor = "Krixel Pinchwhistle", x = 44.9, y = 14.7, zone = "Frostwall" },
    ["Orcish Lumberjack's Stool"] = { method = "Vendor", vendor = "Krixel Pinchwhistle", x = 44.9, y = 14.7, zone = "Frostwall" },
    ["Orcish Scribe's Drafting Table"] = { method = "Vendor", vendor = "Sergeant Grimjaw", x = 43.8, y = 47.4, zone = "Frostwall", mapID = 590 },

    ["Orcish Warlord's Planning Table"] = { method = "Quest", vendor = "Sergeant Grimjaw", x = 43.8, y = 47.4, zone = "Frostwall", mapID = 590 },

    ["Orgrimmar Angled Platform"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Bathtub"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Beam Platform"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Bureaucrat's Desk"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Chair"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },


    -- Twentieth research batch (worldofhousing.io catalogue, page 24).
    ["Orgrimmar Interior Doorway"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Interior Narrow Wall"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Interior Wall"] = { method = "Vendor", vendor = "\"High Tides\" Ren", x = 62.4, y = 80.1, zone = "Founder's Point", mapID = 2352 },

    ["Orgrimmar Large Platform"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Nightstand"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Open Dresser"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Round Interior Pillar"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Round Platform"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Sconce"] = { method = "Drop", vendor = "Skulloc", zone = "Iron Docks Dungeon" },
    ["Orgrimmar Small Platform"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Square Interior Pillar"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Orgrimmar Tusked Bed"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Ornamental Kaldorei Glaive"] = { method = "Quest", vendor = "Ellandrieth", x = 48.2, y = 53.6, zone = "Amirdrassil", mapID = 2239 },
    ["Ornamental Proudmoore Anchor"] = { method = "Quest", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Ornate Cosmic Rug"] = { method = "Quest", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Ornate Cosmic Table"] = { method = "Quest", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Ornate Dwarven Wardrobe"] = { method = "Reputation", vendor = "Dedric Sleetshaper", x = 25, y = 42, zone = "Ironforge", mapID = 87 },

    ["Ornate Ironforge Bench"] = { method = "Reputation", vendor = "Dedric Sleetshaper", x = 25, y = 42, zone = "Ironforge", mapID = 87 },

    ["Ornate Ironforge Table"] = { method = "Reputation", vendor = "Dedric Sleetshaper", x = 25, y = 42, zone = "Ironforge", mapID = 87 },

    ["Ornate Lightwood Table"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Ornate Ochre Window"] = { method = "Reputation", vendor = "Auditor Balwurz", x = 39.2, y = 24.32, zone = "Dornogal", mapID = 2339 },

    ["Ornate Silvermoon Candelabra"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Ornate Stonework Fireplace"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Ornate Suramar Table"] = { method = "Drop", zone = "Court of Stars" },
    ["Ornate Weapon Rack"] = { method = "Vendor", vendor = "Argan Hammerfist", x = 52.2, y = 37.8, zone = "Founder's Point", mapID = 2352 },

    ["Outer Banks Large Garden Cluster"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Overgrown Arathi Trellis"] = { method = "Drop", zone = "Priory of Sacred Flame" },
    ["Overgrown Wildhammer Fountain"] = { method = "Quest", vendor = "Breana Bitterbrand", x = 49.6, y = 29.6, zone = "Twilight Highlands", mapID = 241 },

    ["Pandaren Cooking Table"] = { method = "Reputation", vendor = "Gina Mudclaw", x = 53.2, y = 51.6, zone = "Valley of the Four Winds", mapID = 376 },

    ["Pandaren Cradle Stool"] = { method = "Reputation", vendor = "Tan Shin Tiao", x = 82.2, y = 29.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Pandaren Lacquered Crate"] = { method = "Reputation", vendor = "Tan Shin Tiao", x = 82.2, y = 29.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Pandaren Pantry"] = { method = "Reputation", vendor = "Gina Mudclaw", x = 53.2, y = 51.6, zone = "Valley of the Four Winds", mapID = 376 },

    ["Pandaren Scholar's Bookcase"] = { method = "Reputation", vendor = "Tan Shin Tiao", x = 82.2, y = 29.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Pandaren Scholar's Lectern"] = { method = "Reputation", vendor = "Tan Shin Tiao", x = 82.2, y = 29.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Pandaren Stone Lamppost"] = { method = "Quest", vendor = "Sage Whiteheart", x = 84.62, y = 63.81, zone = "Vale of Eternal Blossoms", mapID = 390 },


    -- Twenty-first research batch (worldofhousing.io catalogue, page 25).
    ["Pandaren Wooden Cart"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Paw'don Well"] = { method = "Reputation", vendor = "Gina Mudclaw", x = 53.2, y = 51.6, zone = "Valley of the Four Winds", mapID = 376 },

    ["Pedestal of the Maelstrom's Wisdom"] = { method = "Vendor", vendor = "Flamesmith Lanying", x = 30.5, y = 60.2, zone = "The Maelstrom", mapID = 726 },

    ["Pentagonal Stone Table"] = { method = "Achievement", vendor = "Silvrath", x = 71.8, y = 49.6, zone = "Valdrakken", mapID = 2134 },

    ["Peon's Work Bucket"] = { method = "Vendor", vendor = "Supplymaster Eri", x = 36.45, y = 40.06, zone = "Frostfire Ridge" },
    ["Pillar Cobweb"] = { method = "Vendor", vendor = "Lonomia", x = 68.2, y = 75.5, zone = "Razorwind Shores", mapID = 2351 },

    ["Pink Gilnean Rose"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Pink Razorwind Paintbrush"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Plain Interior Doorway"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Plain Interior Narrow Wall"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Plain Interior Wall"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Plum Eversong Rug"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Plush Cushioned Chair"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Portal to Damnation"] = { method = "Achievement", vendor = "Ve'nari", x = 46.8, y = 41.6, zone = "The Maw", mapID = 1543 },

    ["Preserved Gift of Gilneas"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon", mapID = 2393 },
    ["Preserver's Censer"] = { method = "Vendor", vendor = "Tethalash", x = 25.6, y = 33.8, zone = "Valdrakken", mapID = 2112 },


    -- Twenty-second research batch (worldofhousing.io catalogue, page 26).
    -- The "Preyseeker" series all share one vendor with no published zone.
    ["Preyseeker's Ethereal Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Ethereal Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Executor Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Executor Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Farstrider Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Farstrider Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Knight-Errant Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Knight-Errant Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Magister Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Magister Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Ornate Plinth"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Plinth"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Ren'dorei Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Ren'dorei Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Rutaani Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Rutaani Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Thornspeaker Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Thornspeaker Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Tinker Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Tinker Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Twilight Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Twilight Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Vindicator Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Vindicator Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Wretched Bust"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyseeker's Wretched Effigy"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Proudmoore Green Drape"] = { method = "Achievement", vendor = "Pearl Barlow", x = 70.8, y = 15.8, zone = "Boralus", mapID = 1161 },


    -- Twenty-third research batch (worldofhousing.io catalogue, page 27).
    ["Purple Suramar Seat Cushion"] = { method = "Reputation", vendor = "Sundries Merchant", x = 50.8, y = 77.8, zone = "Suramar", mapID = 680 },

    ["Pylon Fragment"] = { method = "Vendor", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Qalashi Goulash"] = { method = "Drop", vendor = "Warlord Sargha", zone = "Neltharus Dungeon" },
    ["Rack of Silvermoon Arms"] = { method = "Reputation", vendor = "Armorer Goldcrest", x = 43.4, y = 47.4, zone = "Eversong Woods", mapID = 2395 },

    ["Rambleshire Resting Platform"] = { method = "Achievement", vendor = "Garnett", x = 54.6, y = 57.2, zone = "Dornogal", mapID = 2339 },

    ["Razorwind Acacia Tree"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Bar Table"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Cooking Grill"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Covered Well"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Fighting Cactus"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Flamebrush"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Fountain"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Gobtree"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Palm Tree"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Porch Chair"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Shores Front Door"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Standing Mirror"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Storage Table"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Succulent Palm"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Tumbleweed"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Wall Mirror"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },


    -- Twenty-fourth research batch (worldofhousing.io catalogue, page 28).
    ["Rectangular Elegant Table"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Rectangular Sin'dorei Rug"] = { method = "Vendor", vendor = "Rae'ana", x = 47.8, y = 82, zone = "The Waking Shores", mapID = 2022 },
    ["Red Crane Kite"] = { method = "Reputation", vendor = "San Redscale", x = 56.6, y = 44.4, zone = "The Jade Forest", mapID = 371 },

    ["Red Dazar'alor Tent"] = { method = "Reputation", vendor = "Provisioner Lija", x = 39, y = 79.4, zone = "Nazmir", mapID = 863 },

    ["Red Razorwind Paintbrush"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Red Suramar Seat Cushion"] = { method = "Reputation", vendor = "Sundries Merchant", x = 50.8, y = 77.8, zone = "Suramar", mapID = 680 },

    ["Redundant Reclamation Rig"] = { method = "Achievement", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Reinforced Corner Ethereal Pipe Segment"] = { method = "Reputation", vendor = "Om'sirik", x = 40.61, y = 29.19, zone = "Tazavesh, the Veiled Market", mapID = 2472 },
    ["Reinforced Goblin Umbrella"] = { method = "Quest", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Reinforced Wooden Chest"] = { method = "Quest", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Relaxing Goblin Beach Chair with Cup Gripper"] = { method = "Reputation", vendor = "Boatswain Hardee", x = 63.2, y = 16.8, zone = "Undermine", mapID = 2346 },

    ["Reliquary Storage Crate"] = { method = "Vendor", vendor = "Rae'ana", x = 47.8, y = 82, zone = "The Waking Shores", mapID = 2022 },
    ["Reliquary Telescope"] = { method = "Vendor", vendor = "Rae'ana", x = 47.8, y = 82, zone = "The Waking Shores", mapID = 2022 },
    ["Ren'dorei Anvil"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Ren'dorei Spired Tent"] = { method = "Quest", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Replica Acherus Soul Forge"] = { method = "Achievement", vendor = "Quartermaster Ozorg", x = 99.4, y = 57.2, zone = "Broken Shore" },
    ["Replica Altar of Ancient Kings"] = { method = "Achievement", vendor = "Eadric the Pure", x = 75.5, y = 49.1, zone = "Eastern Plaguelands", mapID = 23 },
    ["Replica Altar of Light and Shadow"] = { method = "Achievement", vendor = "Meridelle Lightspark", x = 39.2, y = 24.7, zone = "Netherlight Temple", mapID = 702 },

    ["Replica Altar of the Eternal Hunt"] = { method = "Achievement", vendor = "Outfitter Reynolds", x = 44.6, y = 48.9, zone = "Trueshot Lodge", mapID = 739 },

    ["Replica Chronicle of Ages"] = { method = "Achievement", vendor = "Caydori Brightstar", x = 50.5, y = 59.0, zone = "The Wandering Isle", mapID = 709 },

    ["Replica Crucible of the Uncrowned"] = { method = "Achievement", vendor = "Kelsey Steelspark", x = 26.92, y = 36.83, zone = "Hall of Shadows", mapID = 626 },
    ["Replica Cursed Forge of the Nathrezim"] = { method = "Achievement", vendor = "Falara Nightsong", x = 59.6, y = 45, zone = "Mardum, the Shattered Abyss" },
    ["Replica Dark Iron Mole Machine"] = { method = "Vendor", vendor = "Plugger Spazzring", zone = "Blackrock Depths" , x = 49.77, y = 32.22, mapID = 1186 },
    ["Replica Felblood Altar"] = { method = "Achievement", vendor = "Gigi Gigavoid", x = 58.5, y = 33.4, zone = "Dreadscar Rift", mapID = 1107 },

    ["Replica Forge of Odyn"] = { method = "Achievement", vendor = "Quartermaster Durnolf", x = 55.5, y = 25.9, zone = "Skyhold", mapID = 695 },

    ["Replica Forge of the Roaring Mountain"] = { method = "Achievement", vendor = "Caydori Brightstar", x = 50.5, y = 59.0, zone = "The Wandering Isle", mapID = 709 },

    ["Replica Grathardormu's Hammer"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Replica Libram of Ancient Kings"] = { method = "Achievement", vendor = "Eadric the Pure", x = 75.5, y = 49.1, zone = "Eastern Plaguelands", mapID = 23 },
    ["Replica Libram of the Dead"] = { method = "Achievement", vendor = "Quartermaster Ozorg", x = 99.4, y = 57.2, zone = "Broken Shore" },
    ["Replica Root of the World"] = { method = "Vendor", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Replica Saga of the Valarjar"] = { method = "Achievement", vendor = "Quartermaster Durnolf", x = 55.5, y = 25.9, zone = "Skyhold", mapID = 695 },

    ["Replica Sky's Hope"] = { method = "Vendor", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Replica Tales of the Hunt"] = { method = "Achievement", vendor = "Outfitter Reynolds", x = 44.6, y = 48.9, zone = "Trueshot Lodge", mapID = 739 },

    ["Replica Tome of Blighted Implements"] = { method = "Achievement", vendor = "Gigi Gigavoid", x = 58.5, y = 33.4, zone = "Dreadscar Rift", mapID = 1107 },

    ["Replica Tome of Fel Secrets"] = { method = "Achievement", vendor = "Falara Nightsong", x = 59.6, y = 45, zone = "Mardum, the Shattered Abyss" },
    ["Replica Tome of the Ancients"] = { method = "Achievement", vendor = "Amurra Thistledew", x = 40.2, y = 21.0, zone = "The Dreamgrove", mapID = 747 },

    ["Replica Wey'nan's Ward"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },


    -- Twenty-fifth research batch (worldofhousing.io catalogue, page 29).
    ["Replica Word of the Conclave"] = { method = "Achievement", vendor = "Meridelle Lightspark", x = 39.2, y = 24.7, zone = "Netherlight Temple", mapID = 702 },

    ["Replica Words of Wind and Earth"] = { method = "Achievement", vendor = "Flamesmith Lanying", x = 30.5, y = 60.2, zone = "The Maelstrom", mapID = 726 },

    ["Restful Wooden Bench"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Retired Industrial Gnomegrabber"] = { method = "Drop", zone = "Mechagon" },
    ["Reverent Sin'dorei Statue"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Ritual-Cursed Sarcophagus"] = { method = "Quest", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Riverbend Jar"] = { method = "Reputation", vendor = "Ransa Greyfeather", x = 37.98, y = 46.13, zone = "Thunder Totem", mapID = 750 },

    ["Riverbend Netting"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Roast Riverbeast Platter"] = { method = "Quest", vendor = "Silvrath", x = 71.6, y = 49.5, zone = "Valdrakken", mapID = 2134 },

    ["Roasted Ram Leg"] = { method = "Vendor", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Rocket-Powered Fountain"] = { method = "Achievement", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Rocket-Unpowered Rocket"] = { method = "Quest", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Rolled Scroll"] = { method = "Vendor", vendor = "Sergeant Crowler", x = 38.33, y = 31.95, zone = "Lunarfall", mapID = 582 },

    ["Root-Woven Door"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Root-Woven Window"] = { method = "Vendor", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Root-Wrapped Reliquary"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, mapID = 2393 },
    ["Rope-Bound Amani Basket"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Rough Wooden Chair"] = { method = "Vendor", vendor = "Sergeant Crowler", x = 38.33, y = 31.95, zone = "Lunarfall", mapID = 582 },

    ["Round Dwarven Table"] = { method = "Reputation", vendor = "Breana Bitterbrand", x = 49.6, y = 29.6, zone = "Twilight Highlands", mapID = 241 },

    ["Round Stitched Cushion"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Round-Top Boulder"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Ruddy Haranir Pigment Bowl"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Rugged Brazier"] = { method = "Quest", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Rugged Stool"] = { method = "Quest", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Runed Dreamweaver Moonstone"] = { method = "Vendor", vendor = "Amurra Thistledew", x = 40.2, y = 21.0, zone = "The Dreamgrove", mapID = 747 },

    ["Runic Parchment"] = { method = "Reputation", vendor = "Rae'ana", x = 47.8, y = 82, zone = "Silvermoon City", mapID = 2022 },
    ["Runner's Empowerment"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Rust-Plated Storage Barrel"] = { method = "Reputation", vendor = "Lab Assistant Laszly", x = 27.21, y = 72.33, zone = "Undermine", mapID = 2346 },

    ["Rustic Harandar Planter"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Rusty Patchwork Tub"] = { method = "Vendor", vendor = "Blair Bass", x = 34.15, y = 71.27, zone = "Undermine", mapID = 2346 },

    ["Rutaani Sporepod"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },


    -- Twenty-sixth research batch (worldofhousing.io catalogue, page 30).
    ["Safety Electrical Cabling"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Sagehold Window"] = { method = "Quest", vendor = "Caspian", x = 59.5, y = 69.6, zone = "Stormsong Valley", mapID = 942 },

    ["Sanctified Flame Lantern"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Sanctum of Light Candelabra"] = { method = "Achievement", vendor = "Eadric the Pure", x = 75.5, y = 49.1, zone = "Eastern Plaguelands", mapID = 23 },
    ["Sanctum of Light Hallway Rug"] = { method = "Vendor", vendor = "Eadric the Pure", x = 75.5, y = 49.1, zone = "Eastern Plaguelands", mapID = 23 },
    ["Sandy Vulpera Banner"] = { method = "Quest", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Scarred Orcish Spear"] = { method = "Quest", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Screw-Sealed Stembarrel"] = { method = "Achievement", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },

    ["Scribe's Working Notes"] = { method = "Vendor", vendor = "Lonalo", x = 58.59, y = 50.36, zone = "Orgrimmar", mapID = 85 },

    ["Scroll of K'aresh's Fall"] = { method = "Achievement", vendor = "Lali the Assistant", x = 82.8, y = 30.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Scroll of the Adherent"] = { method = "Quest", vendor = "Duskcaller Erthix", x = 70.4, y = 57.4, zone = "Talador", mapID = 535 },

    ["Scroll of the Conclave"] = { method = "Achievement", vendor = "Meridelle Lightspark", x = 39.2, y = 24.7, zone = "Netherlight Temple", mapID = 702 },

    ["Sealed Sack of Roasted Kafa"] = { method = "Vendor", vendor = "Brother Dovetail", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Brother Dovetail", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Seaworthy Boralus Bell"] = { method = "Quest", vendor = "Pearl Barlow", x = 70.8, y = 15.8, zone = "Boralus", mapID = 1161 },

    ["Secretive Bookcase Wall"] = { method = "Vendor", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Seed of Ages Cutting"] = { method = "Achievement", vendor = "Amurra Thistledew", x = 40.2, y = 21.0, zone = "The Dreamgrove", mapID = 747 },

    ["Sentinel's Moonwing Gaze"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },

    -- Twenty-seventh research batch (worldofhousing.io catalogue, page 31).
    ["Sethraliss Priest's Pillow"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Shadowforge Grinding Wheel"] = { method = "Quest", vendor = "Master Smith Burninate", x = 39, y = 28, zone = "Searing Gorge", mapID = 32 },

    ["Shadowforge Lamppost"] = { method = "Quest", vendor = "Hoddruc Bladebender", x = 46.8, y = 44.6, zone = "Burning Steppes", mapID = 36 },

    ["Shadowforge Stone Chair"] = { method = "Achievement", vendor = "Dedric Sleetshaper", x = 25, y = 42, zone = "Ironforge", mapID = 87 },

    ["Shadowforge Wooden Box"] = { method = "Quest", vendor = "Master Smith Burninate", x = 39, y = 28, zone = "Searing Gorge", mapID = 32 },

    ["Shadowmoon Greenhouse"] = { method = "Reputation", vendor = "Vindicator Nuurem", zone = "Stormshield", x = 46.34, y = 76.55, mapID = 622 },

    ["Shadowmoon Open-Air Shed"] = { method = "Quest", zone = "Shadowmoon Valley" },
    ["Shal'dorei Seat"] = { method = "Quest", vendor = "Jocenna", x = 49.6, y = 62.8, zone = "Suramar", mapID = 680 },

    ["Shala'nir Feather Bed"] = { method = "Achievement", vendor = "Selfira Ambergrove", x = 54.2, y = 72.4, zone = "Val'sharah", mapID = 641 },

    ["Shaohao Ceremonial Bell"] = { method = "Quest", vendor = "Tan Shin Tiao", x = 82.2, y = 29.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Shellscale Standard"] = { method = "Quest", vendor = "Mrgrgrl", x = 15.0, y = 53.4, zone = "Suramar", mapID = 680 },

    ["Short Orgrimmar Bench"] = { method = "Quest", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Short Orgrimmar Bookcase"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Short Wooden Cabinet"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Silver Hand Banner"] = { method = "Vendor", vendor = "Eadric the Pure", x = 75.5, y = 49.1, zone = "Eastern Plaguelands", mapID = 23 },
    ["Silver Hand Tribute to the Fallen"] = { method = "Vendor", vendor = "Eadric the Pure", x = 75.5, y = 49.1, zone = "Eastern Plaguelands", mapID = 23 },
    ["Silver Hand Weapon Rack"] = { method = "Achievement", vendor = "Eadric the Pure", x = 75.5, y = 49.1, zone = "Eastern Plaguelands", mapID = 23 },
    ["Silvermoon Angled Platform"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Silvermoon Beam Platform"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Silvermoon Curio Shelves"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Silvermoon Energy Focus"] = { method = "Achievement", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Silvermoon Gemmed Chair"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Silvermoon Interior Wall"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Silvermoon Large Platform"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Silvermoon Library Bookcase"] = { method = "Drop", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Silvermoon Painter's Cushion"] = { method = "Achievement", vendor = "Hesta Forlath", x = 44.16, y = 62.72, zone = "Silvermoon City", mapID = 2393 },

    ["Silvermoon Round Platform"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },


    -- Twenty-eighth research batch (worldofhousing.io catalogue, page 32).
    ["Silvermoon Sanctum Focus"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Silvermoon Small Platform"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Silvermoon Sundial"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Silvermoon Sunrise Bush"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Silvermoon Training Dummy"] = { method = "Drop", zone = "Windrunner Spire" },
    ["Silvermoon Wooden Chair"] = { method = "Vendor", vendor = "Dethelin", x = 52.5, y = 47.5, zone = "Silvermoon City", mapID = 2393 },

    ["Silverwing Sentinels Flag"] = { method = "Achievement", vendor = "Riica", zone = "Stormwind City", x = 77.8, y = 65.6, mapID = 84 },

    ["Simple Amani Basket"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Simple Bone-Tied Charm"] = { method = "Vendor", vendor = "Depthdiver Tu'nakit", x = 68.2, y = 20.2, zone = "Zul'Aman", mapID = 2437 },

    ["Simply Adorned Vase and Flowers"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon", mapID = 2393 },
    ["Sin'dorei Artisan's Easel"] = { method = "Vendor", vendor = "Hesta Forlath", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Sin'dorei Crafter's Forge"] = { method = "Reputation", vendor = "Provisioner Vredigar", x = 48, y = 32, zone = "Ghostlands", mapID = 95 },

    ["Sin'dorei Honor Stone"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Sin'dorei Sleeper"] = { method = "Reputation", vendor = "Provisioner Vredigar", x = 48, y = 32, zone = "Ghostlands", mapID = 95 },

    ["Sin'dorei Storage Jar"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Sin'dorei Wine Display"] = { method = "Vendor", vendor = "Hesta Forlath", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Sin'dorei Winged Chaise"] = { method = "Vendor", vendor = "Dethelin", x = 52.5, y = 47.5, zone = "Silvermoon City", mapID = 2393 },

    ["Skyhold Brazier"] = { method = "Vendor", vendor = "Quartermaster Durnolf", x = 55.5, y = 25.9, zone = "Skyhold", mapID = 695 },

    ["Skyhold Spear Rack"] = { method = "Vendor", vendor = "Quartermaster Durnolf", x = 55.5, y = 25.9, zone = "Skyhold", mapID = 695 },

    ["Skyhold War Table"] = { method = "Achievement", vendor = "Quartermaster Durnolf", x = 55.5, y = 25.9, zone = "Skyhold", mapID = 695 },

    ["Skyhorn Arrow Kite"] = { method = "Achievement", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Skyhorn Banner"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Skyhorn Eagle Kite"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Skyhorn Storage Chest"] = { method = "Achievement", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Skyweave Amani Tapestry"] = { method = "Quest", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Slate Cobblestone"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Slate Cobblestone Pair"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Slate Cobblestone Path"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Slate Cobblestone Trio"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Small Bel'ameth Tent"] = { method = "Vendor", vendor = "Ellandrieth", x = 48.2, y = 53.6, zone = "Amirdrassil", mapID = 2239 },
    ["Small Boxwood Bush"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Small Dangling Cobweb"] = { method = "Vendor", vendor = "Lonomia", x = 68.2, y = 75.5, zone = "Razorwind Shores", mapID = 2351 },

    ["Small Elegant End Table"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Small Elegant Padded Chair"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Small Emergency Warning Lamp"] = { method = "Reputation", vendor = "Stolen Royal Vendorbot", x = 73.6, y = 36.6, zone = "Mechagon", mapID = 1462 },


    -- Twenty-ninth research batch (worldofhousing.io catalogue, page 33).
    ["Small Forsaken War Tent"] = { method = "Vendor", vendor = "Provisioner Mukra", x = 51.2, y = 95.2, zone = "Dazar'alor", mapID = 1165 },

    ["Small Fruit Platter"] = { method = "Vendor", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Small Gilnean Table"] = { method = "Quest", vendor = "Wilkinson", x = 20.2, y = 58.2, zone = "Duskwood", mapID = 47 },

    ["Small H.O.M.E. Cog"] = { method = "Drop", zone = "Mechagon" },
    ["Small Highmountain Drum"] = { method = "Reputation", vendor = "Ransa Greyfeather", x = 37.98, y = 46.13, zone = "Thunder Totem", mapID = 750 },

    ["Small Hull'n'Home Table"] = { method = "Vendor", vendor = "Janey Forrest", x = 56.16, y = 46.02, zone = "Boralus", mapID = 1161 },
    ["Small Ironforge Bookcase"] = { method = "Vendor", vendor = "Inge Brightview", x = 76.13, y = 8.09, zone = "Ironforge", mapID = 87 },

    ["Small Jagged Orgrimmar Trellis"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Small Karabor Fountain"] = { method = "Reputation", vendor = "Vindicator Nuurem", zone = "Stormshield", x = 46.34, y = 76.55, mapID = 622 },

    ["Small Leather Rug"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Small Legion Candle"] = { method = "Vendor", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Small Orgrimmar Chair"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Small Orgrimmar Tusked Bed"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Small Poppy Cluster"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Small Purple Suramar Seat Cushion"] = { method = "Reputation", vendor = "Sundries Merchant", x = 50.8, y = 77.8, zone = "Suramar", mapID = 680 },

    ["Small Razorwind Bar Table"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Small Razorwind Square Table"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Small Red Suramar Seat Cushion"] = { method = "Reputation", vendor = "Sundries Merchant", x = 50.8, y = 77.8, zone = "Suramar", mapID = 680 },

    ["Small Stonework Fountain"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Small Val'sharah Bookcase"] = { method = "Quest", vendor = "Second Chair Pawdo", x = 52.96, y = 68.12, zone = "Orgrimmar/Dornogal/Stormwind", mapID = 2339 },
    ["Small Wooden Nightstand"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Small Wooden Stool"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Smoke Lamppost"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Smoldering Energy Forge"] = { method = "Quest", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Spherical Draenic Topiary"] = { method = "Reputation", vendor = "Vindicator Nuurem", zone = "Stormshield", x = 46.34, y = 76.55, mapID = 622 },


    -- Thirtieth research batch (worldofhousing.io catalogue, page 34).
    ["Spiky Banded Barrel"] = { method = "Quest", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Spiritbloom Flower"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Spring-Powered Pointer"] = { method = "Reputation", vendor = "Shredz the Scrapper", x = 53.12, y = 72.63, zone = "Undermine", mapID = 2346 },

    ["Spring-Powered Undermine Chair"] = { method = "Reputation", vendor = "Rocco Razzboom", x = 39, y = 22, zone = "Undermine", mapID = 2346 },

    ["Sprouting Lamppost"] = { method = "Vendor", vendor = "Amurra Thistledew", x = 40.2, y = 21.0, zone = "The Dreamgrove", mapID = 747 },

    ["Square Stormpike Table"] = { method = "Vendor", vendor = "Thanthaldis Snowgleam", x = 44.6, y = 46.4, zone = "Hillsbrad Foothills", mapID = 25 },

    ["Square Suramar Table"] = { method = "Quest", vendor = "Second Chair Pawdo", x = 52.96, y = 68.12, zone = "Orgrimmar, Dornogal, Stormwind City", mapID = 2339 },
    ["Standing Ornate Weapon Rack"] = { method = "Vendor", vendor = "Lefton Farrer", x = 53.48, y = 58.52, zone = "Razorwind Shores", mapID = 2351 },

    ["Sticky Lever"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Stitched Leather Rug"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Stitched Pillow Roll"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Stolen Copy of the Blood Ledger"] = { method = "Achievement", vendor = "Kelsey Steelspark", x = 26.92, y = 36.83, zone = "Hall of Shadows", mapID = 626 },
    ["Stolen Ironforge Seat"] = { method = "Drop", zone = "Freehold" },
    ["Stone Zandalari Lamp"] = { method = "Vendor", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Stonebull Canoe"] = { method = "Reputation", vendor = "Ransa Greyfeather", x = 37.98, y = 46.13, zone = "Thunder Totem", mapID = 750 },

    ["Stonelight Countertop"] = { method = "Quest", vendor = "Garnett", x = 54.6, y = 57.2, zone = "Dornogal", mapID = 2339 },

    ["Stoneveil Ridge Large Garden Cluster"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Stonework Fountain"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },


    -- Thirty-first research batch (worldofhousing.io catalogue, page 35).
    ["Stoppered Gilnean Barrel"] = { method = "Quest", vendor = "Edwin Harly", x = 44, y = 39.8, zone = "Silverpine Forest", mapID = 21 },

    ["Stoppered Spring Water Gourd"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Stormsong Water Pump"] = { method = "Reputation", vendor = "Caspian", x = 59.5, y = 69.6, zone = "Stormsong Valley", mapID = 942 },

    ["Stormstout Brew Keg"] = { method = "Reputation", vendor = "Gina Mudclaw", x = 53.2, y = 51.6, zone = "Valley of the Four Winds", mapID = 376 },

    ["Stormwind Angled Platform"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Stormwind Arched Trellis"] = { method = "Quest", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Stormwind Beam Platform"] = { method = "Quest", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Stormwind Bean Seller's Stand"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Stormwind Footlocker"] = { method = "Drop", vendor = "Vanessa VanCleef", zone = "The Deadmines" },
    ["Stormwind Forge"] = { method = "Quest", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Stormwind Gazebo"] = { method = "Reputation", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Stormwind Interior Pillar"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Stormwind Keg Stand"] = { method = "Reputation", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Stormwind Lamppost"] = { method = "Reputation", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Stormwind Large Platform"] = { method = "Quest", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Stormwind Large Wooden Table"] = { method = "Reputation", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Stormwind Peddler's Cart"] = { method = "Reputation", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Stormwind Produce Seller's Stand"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Stormwind Round Platform"] = { method = "Quest", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Stormwind Small Platform"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Stormwind Spice Merchant's Stand"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Stormwind Trellis and Basin"] = { method = "Reputation", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Stormwind Weapon Rack"] = { method = "Quest", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Stormwind Wooden Bench"] = { method = "Quest", vendor = "Sergeant Crowler", x = 38.33, y = 31.95, zone = "Lunarfall", mapID = 582 },

    ["Stormwind Wooden Stool"] = { method = "Quest", vendor = "Sergeant Crowler", x = 38.33, y = 31.95, zone = "Lunarfall", mapID = 582 },

    ["Stormwind Wooden Table"] = { method = "Quest", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Stormwind Workbench"] = { method = "Vendor", vendor = "Sergeant Crowler", x = 38.33, y = 31.95, zone = "Lunarfall", mapID = 582 },

    ["Strong Sniffin' Incense"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Studious Dracthyr's Tomes"] = { method = "Vendor", vendor = "Provisioner Aristta", x = 61.4, y = 31.4, zone = "Thaldraszus", mapID = 2025 },

    ["Sturdy Covered Wagon"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Sturdy Drive Belt"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Sturdy Fireplace"] = { method = "Quest", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Sturdy Haranir Handcart"] = { method = "Quest", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Sturdy Open Wagon"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Sturdy Roofed Wagon"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Sturdy Sheltering Tent"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },


    -- Batches 32-35 (worldofhousing.io catalogue, pages 36-39).
    ["Sturdy Void Elf Barricade"] = { method = "Quest", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Sturdy Void Elf Crate"] = { method = "Quest", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Sturdy Void Elf Trunk"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Sturdy Wall Rack"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Sturdy Weapon Rack"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Sturdy Wine Press"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Sturdy Wooden Bathtub"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Sturdy Wooden Bed"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Sturdy Wooden Bench"] = { method = "Quest", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Sturdy Wooden Bookcase"] = { method = "Quest", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Sturdy Wooden Chair"] = { method = "Quest", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Sturdy Wooden Coffin"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Sturdy Wooden Interior Door"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Sturdy Wooden Interior Pillar"] = { method = "Vendor", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Sturdy Wooden Shelf"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Sturdy Wooden Table"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Sturdy Wooden Trellis"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Sturdy Wooden Washbasin"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Sturdy Wooden Wheelbarrow"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Sumptuous Berry Pie"] = { method = "Quest", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Sunlit Glass Mirror"] = { method = "Reputation", vendor = "Apprentice Diell", x = 43.52, y = 47.52, zone = "Eversong Woods", mapID = 2395 },

    ["Sunset Aster Flowers"] = { method = "Vendor", vendor = "Botanist Boh'an", x = 53.62, y = 57.51, zone = "Razorwind Shores", mapID = 2351 },

    ["Suramar Library"] = { method = "Reputation", vendor = "First Arcanist Thalyssra", x = 34.8, y = 48.1, zone = "Suramar", mapID = 680 },

    ["Suramar Sconce"] = { method = "Reputation", vendor = "First Arcanist Thalyssra", x = 34.8, y = 48.1, zone = "Suramar", mapID = 680 },

    ["Suramar Stepping Stone"] = { method = "Vendor", vendor = "Mynde", x = 45.48, y = 69.50, zone = "Suramar", mapID = 680 },

    ["Suramar Stepping Stone Set"] = { method = "Vendor", vendor = "Mynde", x = 45.48, y = 69.50, zone = "Suramar", mapID = 680 },

    ["Suramar Street Light"] = { method = "Reputation", vendor = "First Arcanist Thalyssra", x = 34.8, y = 48.1, zone = "Suramar", mapID = 680 },

    ["Suramar Window"] = { method = "Quest", vendor = "Jocenna", x = 49.6, y = 62.8, zone = "Suramar", mapID = 680 },

    ["Surwich Peddler's Wagon"] = { method = "Quest", vendor = "Maurice Essman", x = 45.8, y = 88.6, zone = "Blasted Lands", mapID = 17 },

    ["Swirling Ritual Pedestal"] = { method = "Quest", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Tale of the Penultimate Lich King"] = { method = "Achievement", vendor = "Lali the Assistant", x = 82.8, y = 30.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Tall Sturdy Wooden Bookcase"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Tall Sturdy Wooden Chair"] = { method = "Quest", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Tattered Vanguard Banner"] = { method = "Drop", zone = "The Voidspire" },
    ["Tauren Bluff Rug"] = { method = "Quest", vendor = "Brave Tuho", x = 46.6, y = 50.6, zone = "Thunder Bluff", mapID = 88 },

    ["Tauren Hanging Brazier"] = { method = "Reputation", vendor = "Ransa Greyfeather", x = 37.98, y = 46.13, zone = "Thunder Totem", mapID = 750 },

    ["Tauren Jeweler's Roller"] = { method = "Achievement", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Tauren Storyteller's Frame"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Tauren Vertical Windmill"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Tauren Waterwheel"] = { method = "Reputation", vendor = "Ransa Greyfeather", x = 37.98, y = 46.13, zone = "Thunder Totem", mapID = 750 },

    ["Tauren Windmill"] = { method = "Reputation", vendor = "Ransa Greyfeather", x = 37.98, y = 46.13, zone = "Thunder Totem", mapID = 750 },

    ["Tazaveshi Hookah"] = { method = "Vendor", vendor = "Aeeshna", x = 53, y = 39.0, zone = "Founder's Point", hordeVendor = "Aeeshna", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Teal Suramar Seat Cushion"] = { method = "Reputation", vendor = "Sundries Merchant", x = 50.8, y = 77.8, zone = "Suramar", mapID = 680 },

    ["Telredor Recliner"] = { method = "Reputation", vendor = "Maaria", x = 33.5, y = 49.7, zone = "Lunarfall", mapID = 582 },

    ["Tented Cobweb"] = { method = "Vendor", vendor = "Lonomia", x = 68.2, y = 75.5, zone = "Razorwind Shores", mapID = 2351 },

    ["Thalassian Academy Dictation Device"] = { method = "Vendor", vendor = "Hesta Forlath", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Thalassian Chest"] = { method = "Vendor", vendor = "Hesta Forlath", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["The Great Hoard"] = { method = "Achievement", vendor = "Evantkis", x = 58.6, y = 57.6, zone = "Valdrakken", mapID = 2112 },

    ["Thelsamar Hanging Lantern"] = { method = "Quest", vendor = "Drac Roughcut", x = 35.6, y = 49, zone = "Loch Modan", mapID = 48 },

    ["Three-Candle Wrought Iron Chandelier"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Three-Tier Zul'Aman Shelf"] = { method = "Vendor", vendor = "Chel the Chip", x = 31.6, y = 26.2, zone = "Zul'Aman" },
    ["Thunder Totem Brazier"] = { method = "Drop", zone = "Neltharion's Lair" },
    ["Thunder Totem Kiln"] = { method = "Reputation", vendor = "Ransa Greyfeather", x = 37.98, y = 46.13, zone = "Thunder Totem", mapID = 750 },

    ["Thunder Totem Mailbox"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Tidesage's Bookcase"] = { method = "Reputation", vendor = "Provisioner Fray", x = 67.5, y = 21.5, zone = "Boralus", mapID = 895 },

    ["Tidesage's Double Bookshelves"] = { method = "Reputation", vendor = "Provisioner Fray", x = 67.5, y = 21.5, zone = "Boralus", mapID = 895 },

    ["Tidesage's Fireplace"] = { method = "Drop", zone = "Shrine of the Storm (Dungeon)" },
    ["Tied-Open Folk Curtains"] = { method = "Vendor", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Tied-Open Leather Curtains"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Tied-Right Leather Curtains"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Tiragarde Emblem"] = { method = "Quest", vendor = "Pearl Barlow", x = 70.8, y = 15.8, zone = "Boralus", mapID = 1161 },

    ["Tiragarde Treasure Chest"] = { method = "Achievement", vendor = "Pearl Barlow", x = 70.8, y = 15.8, zone = "Boralus", mapID = 1161 },

    ["Tired Troll's Bench"] = { method = "Quest", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Tirisfal Wooden Chair"] = { method = "Quest", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Zuldazar", mapID = 862 },

    ["Tirisgarde Banner"] = { method = "Vendor", vendor = "Jackson Watkins", x = 45.4, y = 57.0, zone = "Hall of the Guardian", mapID = 735 },

    ["Tirisgarde Book Tempest"] = { method = "Achievement", vendor = "Jackson Watkins", x = 45.4, y = 57.0, zone = "Hall of the Guardian", mapID = 735 },

    ["Tirisgarde Brazier"] = { method = "Vendor", vendor = "Jackson Watkins", x = 45.4, y = 57.0, zone = "Hall of the Guardian", mapID = 735 },

    ["Tirisgarde Candle"] = { method = "Vendor", vendor = "Jackson Watkins", x = 45.4, y = 57.0, zone = "Hall of the Guardian", mapID = 735 },

    ["Tirisgarde War Map"] = { method = "Achievement", vendor = "Jackson Watkins", x = 45.4, y = 57.0, zone = "Hall of the Guardian", mapID = 735 },

    ["Tome of Draenei Faith"] = { method = "Vendor", vendor = "Lonalo", x = 58.59, y = 50.36, zone = "Orgrimmar", mapID = 85 },

    ["Tome of Earthen Directives"] = { method = "Achievement", vendor = "Jorid", x = 57, y = 60.6, zone = "Dornogal", mapID = 2339 },

    ["Tome of Forsaken Resilience"] = { method = "Vendor", vendor = "Lonalo", x = 58.59, y = 50.36, zone = "Orgrimmar", mapID = 85 },

    ["Tome of Pandaren Wisdom"] = { method = "Drop", zone = "Temple of Jade Serpent" },
    ["Tome of Reliquary Insights"] = { method = "Drop", zone = "Karazhan (Legion)" },
    ["Tome of Shadowforge Cunning"] = { method = "Vendor", vendor = "Lonalo", x = 58.59, y = 50.36, zone = "Orgrimmar", mapID = 85 },

    ["Tome of Silvermoon Intrigue"] = { method = "Achievement", vendor = "Lali the Assistant", x = 82.8, y = 30.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Tome of the Corrupt"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Tome of the Lost Dragon"] = { method = "Quest", vendor = "Berazus", x = 47.8, y = 23.2, zone = "Azsuna", mapID = 630 },

    ["Tome of the Survivor"] = { method = "Achievement", vendor = "Lali the Assistant", x = 82.8, y = 30.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Traditional Shal'dorei Rug"] = { method = "Vendor", vendor = "Leyweaver Inondra", x = 40.62, y = 69.53, zone = "Suramar", mapID = 680 },

    ["Trashfire Barrel"] = { method = "Drop", zone = "Undermine" },
    ["Triple-Tested Steam Valve"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Trueshot Lodge Fireplace"] = { method = "Vendor", vendor = "Outfitter Reynolds", x = 44.6, y = 48.9, zone = "Trueshot Lodge", mapID = 739 },

    ["Trueshot Lodge Weapon Rack"] = { method = "Vendor", vendor = "Outfitter Reynolds", x = 44.6, y = 48.9, zone = "Trueshot Lodge", mapID = 739 },

    ["Trueshot Skeletal Dragon Head"] = { method = "Achievement", vendor = "Outfitter Reynolds", x = 44.6, y = 48.9, zone = "Trueshot Lodge", mapID = 739 },

    ["Turning Silvermoon Archives"] = { method = "Reputation", vendor = "Caeris Fairdawn", x = 43.46, y = 47.42, zone = "Eversong Woods", mapID = 2395 },

    ["Tusked Candleholder"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Tusked Chandelier"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Tusked Fireplace"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Tusked Gazebo"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Tusked Hanging Sconce"] = { method = "Vendor", vendor = "\"High Tides\" Ren", x = 62.4, y = 80.1, zone = "Founder's Point", mapID = 2352 },

    ["Tusked Sconce"] = { method = "Vendor", vendor = "\"High Tides\" Ren", x = 62.4, y = 80.1, zone = "Founder's Point", mapID = 2352 },

    ["Tusked Weapon Rack"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Tusked Weapon Stand"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Twilight Tabernacle"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, mapID = 2393 },
    ["Uncontested Battlefield Banner"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Uncorrupted Eye of Terokk"] = { method = "Quest", vendor = "Ruuan the Seer", x = 46.6, y = 45, zone = "Spires of Arak", mapID = 542 },

    ["Uncrowned Apothecary's Cabinet"] = { method = "Vendor", vendor = "Kelsey Steelspark", x = 26.92, y = 36.83, zone = "Hall of Shadows", mapID = 626 },
    ["Uncrowned Apothecary's Supplies"] = { method = "Vendor", vendor = "Kelsey Steelspark", x = 26.92, y = 36.83, zone = "Hall of Shadows", mapID = 626 },
    ["Uncrowned Banner"] = { method = "Vendor", vendor = "Kelsey Steelspark", x = 26.92, y = 36.83, zone = "Hall of Shadows", mapID = 626 },
    ["Uncrowned Market Stall"] = { method = "Achievement", vendor = "Kelsey Steelspark", x = 26.92, y = 36.83, zone = "Hall of Shadows", mapID = 626 },
    ["Uncrowned Planning Table"] = { method = "Achievement", vendor = "Kelsey Steelspark", x = 26.92, y = 36.83, zone = "Hall of Shadows", mapID = 626 },
    ["Undercity Spiked Chest"] = { method = "Vendor", vendor = "Captain Zen'taga", x = 44.5, y = 94.4, zone = "Zandalar", mapID = 1165 },
    ["Underdecorated Underground Table"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Undermine Alleyway Sconce"] = { method = "Reputation", vendor = "Boatswain Hardee", x = 63.2, y = 16.8, zone = "Undermine", mapID = 2346 },

    ["Undermine Bookcase"] = { method = "Reputation", vendor = "Sitch Lowdown", x = 30.6, y = 38.8, zone = "Undermine", mapID = 2346 },

    ["Undermine Fence"] = { method = "Reputation", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Undermine Fencepost"] = { method = "Reputation", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Undermine Market Stall"] = { method = "Quest", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Undermine Mechanic's Hanging Lamp"] = { method = "Reputation", vendor = "Lab Assistant Laszly", x = 27.21, y = 72.33, zone = "Undermine", mapID = 2346 },

    ["Undermine Rectangular Table"] = { method = "Reputation", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Undermine Round Table"] = { method = "Reputation", vendor = "Stacks Topskimmer", x = 43.2, y = 50.6, zone = "Undermine", mapID = 2346 },

    ["Undermine Wall Shelf"] = { method = "Reputation", vendor = "Shredz the Scrapper", x = 53.12, y = 72.63, zone = "Undermine", mapID = 2346 },

    ["Unseen Path Archer's Gallery"] = { method = "Achievement", vendor = "Outfitter Reynolds", x = 44.6, y = 48.9, zone = "Trueshot Lodge", mapID = 739 },

    ["Val'sharah Bookcase"] = { method = "Quest", vendor = "Myria Glenbrook", x = 60, y = 84.8, zone = "Val'sharah", mapID = 641 },

    ["Valarjar Banner"] = { method = "Vendor", vendor = "Quartermaster Durnolf", x = 55.5, y = 25.9, zone = "Skyhold", mapID = 695 },

    ["Valarjar Shield Wall"] = { method = "Achievement", vendor = "Quartermaster Durnolf", x = 55.5, y = 25.9, zone = "Skyhold", mapID = 695 },

    ["Valdrakken Bookcase"] = { method = "Drop", vendor = "Echo of Doragosa", zone = "Algeth'ar Academy" },
    ["Valdrakken Chandelier"] = { method = "Quest", vendor = "Second Chair Pawdo", x = 52.96, y = 68.12, zone = "Orgrimmar/Dornogal/Stormwind", mapID = 2339 },
    ["Valdrakken Garden Fountain"] = { method = "Vendor", vendor = "Silvrath", x = 71.8, y = 49.6, zone = "Valdrakken", mapID = 2134 },

    ["Valdrakken Hanging Lamp"] = { method = "Drop", zone = "Ruby Life Pools" },
    ["Valdrakken Lamppost"] = { method = "Quest", vendor = "Silvrath", x = 71.8, y = 49.6, zone = "Valdrakken", mapID = 2134 },

    ["Valdrakken Oven"] = { method = "Vendor", vendor = "Silvrath", x = 71.8, y = 49.6, zone = "Valdrakken", mapID = 2134 },

    ["Valdrakken Sconce"] = { method = "Achievement", vendor = "Ironus Coldsteel", x = 52.2, y = 80.8, zone = "Thaldraszus", mapID = 2025 },

    ["Valdrakken Stone Stool"] = { method = "Quest", vendor = "Silvrath", x = 71.8, y = 49.6, zone = "Valdrakken", mapID = 2134 },


    -- Batches 36-38 (worldofhousing.io catalogue, pages 40-42 - the last
    -- pages the catalogue has; page 43 returned no results).
    ["Veilroot Fountain"] = { method = "Drop", zone = "The Blinding Vale" },
    ["Venthyr Tome of Unforgiven Sins"] = { method = "Vendor", vendor = "Chachi the Artiste", x = 54.0, y = 24.7, zone = "Sinfall", mapID = 1699 },

    ["Vertical Felsteel Chain"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Visage of Akil'zon, Loa of Victory"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Visage of Halazzi, Loa of the Hunt"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Visage of Jan'alai, Loa of Fire"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Visage of Nalorakk, Loa of War"] = { method = "Vendor", vendor = "Magovu", x = 45.8, y = 65.8 },
    ["Void Elf Barrel"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Void Elf Floating Desk"] = { method = "Reputation", vendor = "Rae'ana", x = 47.8, y = 82, zone = "Silvermoon City", mapID = 2022 },
    ["Void Elf Floating Lantern"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Void Elf Scribe's Desk"] = { method = "Reputation", vendor = "Rae'ana", x = 47.8, y = 82, zone = "Silvermoon City", mapID = 2022 },
    ["Void Elf Stool"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Void Elf Table"] = { method = "Reputation", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Void Elf Weapon Rack"] = { method = "Achievement", vendor = "Void Researcher Aemely", x = 52.6, y = 72.8, zone = "Voidstorm", mapID = 2405 },

    ["Void Flame Candle"] = { method = "Reputation", vendor = "Rae'ana", x = 47.8, y = 82, zone = "Silvermoon City", mapID = 2022 },
    ["Void Inkwell"] = { method = "Reputation", vendor = "Rae'ana", x = 47.8, y = 82, zone = "Silvermoon City", mapID = 2022 },
    ["Void-Corrupted Fountain"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon", mapID = 2393 },
    ["Void-Corrupted Rotunda"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon", mapID = 2393 },
    ["Voidbound Holding Cell"] = { method = "Drop", zone = "The Voidspire" },
    ["Voidlight Brazier"] = { method = "Drop", zone = "Voidstorm" },
    ["Voltaic Trigore Egg"] = { method = "Drop", zone = "Voidspire" },
    ["Vrykul Lord's Throne"] = { method = "Achievement", vendor = "Val'zuun", x = 67, y = 60.2, zone = "Dalaran", mapID = 628 },
    ["Waning Wood Fence"] = { method = "Quest", vendor = "Wilkinson", x = 20.2, y = 58.2, zone = "Duskwood", mapID = 47 },

    ["War Creche Teaching Crystal"] = { method = "Quest", vendor = "Hordranin", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Hordranin", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Warbrave's Brazier"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Ward of the Shul'ka"] = { method = "Vendor", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Warm Haranir Blanket"] = { method = "Vendor", vendor = "Mothkeeper Wew'tam", x = 49.28, y = 54.35, zone = "Harandar", mapID = 2413 },

    ["Warsong Footrest"] = { method = "Vendor", vendor = "Moz'def", x = 60.0, y = 50.4, zone = "Frostfire Ridge" },
    ["Warsong Outriders Flag"] = { method = "Achievement", vendor = "Joruh", zone = "Orgrimmar", x = 38.8, y = 71.9, mapID = 85 },

    ["Warsong Workbench"] = { method = "Vendor", vendor = "Sergeant Grimjaw", x = 43.8, y = 47.4, zone = "Frostwall", mapID = 590 },

    ["Waterlogged Haranir Pigment Bowl"] = { method = "Vendor", vendor = "Maku", x = 53, y = 50.8, zone = "Harandar", mapID = 2576 },

    ["Weather-Treated Wooden Table"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Weathered History of the Warchiefs"] = { method = "Quest", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Well-Built Well"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Well-Lit Incontinental Loveseat"] = { method = "Vendor", vendor = "Ando the Gat", x = 48.1, y = 56.7, zone = "Liberation of Undermine", mapID = 2406 },

    ["Well-Oiled Machine Cog"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Westfall Woven Basket"] = { method = "Quest", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Whitewash River Basket"] = { method = "Quest", vendor = "Torv Dubstomp", x = 56, y = 78, zone = "Thunder Totem", mapID = 652 },
    ["Wicker Basket"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Wide Charming Couch"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Wide Hide-Covered Bench"] = { method = "Quest", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Wind Rider Roost"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Windmark Tribal Charm"] = { method = "Vendor", vendor = "Depthdiver Tu'nakit", x = 68.2, y = 20.2, zone = "Zul'Aman", mapID = 2437 },

    ["Wolf Pelt Rug"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Woodblock Stool"] = { method = "Vendor", vendor = "Chel the Chip", x = 31.6, y = 26.2, zone = "Zul'Aman" },
    ["Wooden Chamberstick"] = { method = "Quest", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Wooden Coffin Lid"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Wooden Doghouse"] = { method = "Quest", vendor = "Gina Mudclaw", x = 53.2, y = 51.6, zone = "Valley of the Four Winds", mapID = 376 },

    ["Wooden Gazebo"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Wooden Mug"] = { method = "Vendor", vendor = "Peter", x = 52.0, y = 44.4, zone = "Lunarfall", mapID = 582 },

    ["Wooden Outhouse"] = { method = "Quest", vendor = "Woodsman Drake", x = 32.4, y = 60, zone = "Grizzly Hills", mapID = 116 },

    ["Wooden Storage Crate"] = { method = "Vendor", vendor = "Sergeant Crowler", x = 38.33, y = 31.95, zone = "Lunarfall", mapID = 582 },

    ["Worgen's Chicken Coop"] = { method = "Quest", vendor = "Lord Candren", x = 37, y = 47.8, zone = "Stormwind City", mapID = 89 },
    ["Worker's Wooden Desk"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Writings of Reshad the Outcast"] = { method = "Quest", vendor = "Ruuan the Seer", x = 46.6, y = 45, zone = "Spires of Arak", mapID = 542 },

    ["Wrought Iron Chandelier"] = { method = "Quest", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Wrought Iron Floor Lamp"] = { method = "Quest", vendor = "Xiao Dan", x = 52.0, y = 38.3, zone = "Founder's Point", mapID = 2352 },

    ["Young Chestnut Tree"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Youngling's Courser Toys"] = { method = "Quest", vendor = "Sergeant Grimjaw", x = 43.8, y = 47.4, zone = "Frostwall", mapID = 590 },

    ["Z-205 Mechanical Device"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 52.9, y = 38.8, zone = "Founder's Point", hordeVendor = "Pascal-K1N6", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.0, mapID = 2352, hordeMapID = 2351 },

    ["Zandalari Rickshaw"] = { method = "Quest", vendor = "Provisioner Lija", x = 39, y = 79.4, zone = "Nazmir", mapID = 863 },

    ["Zandalari Sconce"] = { method = "Reputation", vendor = "Provisioner Lija", x = 39, y = 79.4, zone = "Nazmir", mapID = 863 },

    ["Zandalari Wall Shelf"] = { method = "Achievement", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Zandalari War Brazier"] = { method = "Reputation", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Zandalari War Chandelier"] = { method = "Vendor", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Zandalari War Torch"] = { method = "Reputation", vendor = "Provisioner Lija", x = 39, y = 79.4, zone = "Nazmir", mapID = 863 },

    ["Zandalari Weapon Rack"] = { method = "Vendor", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Zaralek Candles"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Zaralek Snail Cart"] = { method = "Vendor", vendor = "Harlowe Marl", x = 53, y = 38.9, zone = "Founder's Point", hordeVendor = "Harlowe Marl", hordeZone = "Razorwind Shores", hordeX = 54.9, hordeY = 57.1, mapID = 2352, hordeMapID = 2351 },

    ["Zocalo Drinks"] = { method = "Quest", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Zul'Aman Ancestral Fountain"] = { method = "Quest", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Zul'Aman Armament Rest"] = { method = "Vendor", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Zul'Aman Flame Cradle"] = { method = "Quest", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Zul'Aman Forest Hammock"] = { method = "Vendor", vendor = "Depthdiver Tu'nakit", x = 68.2, y = 20.2, zone = "Zul'Aman", mapID = 2437 },

    ["Zuldazar Cook's Griddle"] = { method = "Achievement", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },
    ["Zuldazar Stool"] = { method = "Quest", vendor = "T'lama", x = 36, y = 61, zone = "The Great Seal", mapID = 1164 },

    -- Second source: housing.wowdb.com/decor/ (much larger, 3,158 items /
    -- 132 pages, includes variants worldofhousing.io didn't list separately).
    -- Only genuinely NEW item names added here - anything already keyed
    -- above from worldofhousing.io is left as-is rather than overwritten, to
    -- avoid re-litigating entries that already checked out against this
    -- second source during spot-checking (Riica, Corlen Hordralin, Hesta
    -- Forlath all matched exactly).
    ["590 Quel'Lithien Red Display Bottle"] = { method = "Vendor", vendor = "Hesta Forlath", x = 54.3, y = 56.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Adorned Hanging Razorwind Ropes"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Adorned Sin'dorei Satchel"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Aged Tortollan Scroll Case"] = { method = "Vendor", vendor = "Second Mate Sluggs", x = 51.6, y = 49.8, zone = "The Coiled Isle" },
    ["Altar of Corrosion"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Amani Anvil"] = { method = "Vendor", vendor = "Griftah", x = 62.5, y = 79.2, zone = "Founder's Point", mapID = 2352 },

    ["Amani Blueflame Chandelier"] = { method = "Drop", zone = "Delves" },
    ["Amani Building Peg"] = { method = "Vendor", vendor = "Griftah", x = 40.2, y = 72.8, zone = "Razorwind Shores", mapID = 2351 },

    ["Amani Decorative Plinth"] = { method = "Vendor", vendor = "Griftah", x = 62.5, y = 79.2, zone = "Founder's Point", mapID = 2352 },

    ["Amani Forge"] = { method = "Achievement", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Amani Forgemaster's Decorative Spear"] = { method = "Craft" },
    ["Amani Forgemaster's Rack"] = { method = "Craft" },
    ["Amani Forgemaster's Workbench"] = { method = "Craft" },
    ["Amani Hex Candle"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Amani Horn Beaker"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Amani Open Fire Grill"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Amani Ritual Candles"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Amani Ritual Totem"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Amani Road Marker"] = { method = "Vendor", vendor = "Griftah", x = 40.2, y = 72.8, zone = "Razorwind Shores", mapID = 2351 },

    ["Amani Storage Crate"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Amani Supply Sack"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Amani Territorial Totem"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, zone = "Silvermoon City", mapID = 2393 },

    ["Amani Water Well"] = { method = "Vendor", vendor = "Griftah", x = 40.2, y = 72.8, zone = "Razorwind Shores", mapID = 2351 },

    ["Amani Wayfarer's Torch"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Amani Wicker Crate"] = { method = "Vendor", vendor = "Griftah", x = 62.5, y = 79.2, zone = "Founder's Point", mapID = 2352 },

    ["Amani Worship Candle"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Amethyst Argunite Crystal"] = { method = "Vendor", vendor = "Adjutant Vortus", zone = "Antorus, the Burning Throne" },
    ["Ancestral Signal Brazier"] = { method = "Craft" },
    ["Ancient Amani Mural"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, zone = "Silvermoon City", mapID = 2393 },

    ["Ancient Elven Highback Chair"] = { method = "Drop", vendor = "Glimmering Treasure Chest" },
    ["Ancient Memories of the Sea"] = { method = "Vendor", vendor = "Taifa", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Anima-Infused Dreamcatcher"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Anima-Powered Kyrian Oven"] = { method = "Vendor", vendor = "Adjutant Nikos", x = 52.23, y = 47.11, zone = "Bastion" },
    ["Apothecary's Tortollan Display Rack"] = { method = "Vendor", vendor = "Taifa", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Aqir Hunter's Trophy"] = { method = "Quest", zone = "Silvermoon City" },
    ["Arathor Toy Sword"] = { method = "Quest", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Arched Violet Bellflowers"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point/Razorwind Shores", mapID = 2352 },
    ["Arched Wooden Bench"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point/Razorwind Shores", mapID = 2352 },
    ["Arching Crimson Ivy"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },

    -- housing.wowdb.com/decor/ pages 5-8.
    ["Argunite Crystal Storage"] = { method = "Vendor", vendor = "Vindicator Jaelaana", zone = "The Vindicaar" },
    ["Argunite Sconce"] = { method = "Vendor", vendor = "Vindicator Jaelaana", zone = "The Vindicaar" },
    ["Atal'Utek Ivy"] = { method = "Vendor", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Bakar's Dinner"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 54.2, y = 56.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Bakar's Favorite Ball"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 54.2, y = 56.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Bakar's Napping Rug"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 52.8, y = 37.6, zone = "Founder's Point" },
    ["Bakar's Snack"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 54.2, y = 56.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Banner of Five Dawns"] = { method = "Vendor", vendor = "Caydori Brightstar", x = 50.5, y = 59.0, zone = "Mandori Village", mapID = 709 },
    ["Bartender Bob's \"No Weapons Allowed\" Rack"] = { method = "Vendor", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Beguiling Memories of the Sea"] = { method = "Vendor", vendor = "Taifa", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Blackrock Strongbox"] = { method = "Vendor", vendor = "Kil'rip", x = 51.5, y = 60.5, zone = "Frostwall", mapID = 590 },

    ["Black Vulpera Cushion"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Blessed Phoenix Egg"] = { method = "Drop", vendor = "Belo'ren", zone = "Quel'Danas" },
    ["Blightfire Candle"] = { method = "Quest", vendor = "Halenthos Brightstride", x = 67, y = 33, zone = "Dalaran", mapID = 627 },
    ["Blightfire Hanging Lantern"] = { method = "Vendor", vendor = "Provisioner Mukra", x = 51.2, y = 95.2, zone = "Zuldazar", mapID = 1165 },
    ["Blightfire Lantern"] = { method = "Vendor", vendor = "Provisioner Mukra", x = 51.2, y = 95.2, zone = "Zuldazar", mapID = 1165 },
    ["Blightfire Sconce"] = { method = "Vendor", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Dazar'alor", mapID = 862 },
    ["Blightfire Torch"] = { method = "Vendor", vendor = "Arcanist Peroleth", x = 58, y = 62.6, zone = "Dazar'alor", mapID = 862 },
    ["Blood Elven Candelabra"] = { method = "Vendor", vendor = "Rae'ana", x = 47.8, y = 82, zone = "Dragonscale Basecamp", mapID = 2022 },
    ["Blood Knight's Decorative Shield"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Bloodtotem Banner"] = { method = "Drop", zone = "Highmountain" },

    -- housing.wowdb.com/decor/ pages 9-12.
    ["Blooming Celestial Dreamleaf"] = { method = "Vendor", vendor = "Aithlyn", x = 59.5, y = 32.5, zone = "Heart of the Forest" },
    ["Blossoming Forge"] = { method = "Drop", zone = "Delves" },
    ["Bluebird's Golden Cage"] = { method = "Quest", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Blue Dazar'alor Rug"] = { method = "Vendor", vendor = "T'lama", x = 36, y = 61, zone = "Zuldazar", mapID = 1164 },
    ["Blue-Glo Lantern"] = { method = "Vendor", vendor = "Pascal-K1N6", x = 54.9, y = 57.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Blue Tortollan Signpost"] = { method = "Vendor", vendor = "Second Mate Sluggs", x = 51.6, y = 49.8, zone = "The Coiled Isle" },
    ["Blue Vulpera Cushion"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Boardcraft Forsaken Figurine"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Boardcraft Human Figurine"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Bold Kobold Kabin"] = { method = "Vendor", vendor = "Timicky", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Bound-Left Silvermoon Drapes"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Bound-Right Silvermoon Drapes"] = { method = "Vendor", vendor = "Jehzar Starfall", x = 53.53, y = 58.53, zone = "Razorwind Shores", mapID = 2351 },

    ["Bound Silvermoon Drapes"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Brewfest Crate"] = { method = "Vendor", vendor = "Dizzy Alechux", x = 40.3, y = 17.3, zone = "Durotar" },
    ["Brewfest Fence"] = { method = "Vendor", vendor = "Fay Stouthammer", x = 56.1, y = 36.7, zone = "Dun Morogh" },
    ["Brewfest Fencepost"] = { method = "Vendor", vendor = "Dizzy Alechux", x = 40.3, y = 17.3, zone = "Durotar" },
    ["Broken Amani Ritual Urn"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Broken Founder's Point Fence"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Buckled Witch Hat"] = { method = "Vendor", vendor = "Holly Twinklebright", x = 54.26, y = 32.78, zone = "Founder's Point", mapID = 2352 },

    ["Candle Cage"] = { method = "Vendor", vendor = "Timicky", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Candlelit Smiling Jack-o'-Lantern"] = { method = "Vendor", vendor = "Holly Twinklebright", x = 54.26, y = 32.78, zone = "Founder's Point", mapID = 2352 },

    ["Caravan Smith's Anvil"] = { method = "Vendor", vendor = "Hoarder Jena", x = 57, y = 50, zone = "Vol'dun" },
    ["Carved Argunite Supply"] = { method = "Vendor", vendor = "Adjutant Vortus", zone = "The Vindicaar" },
    ["Carved Elven Bookcase"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Carved Stone Bench"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Carved Wooden Chair"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Cauldron of Ula'tek"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Celadon Argunite Crystal"] = { method = "Vendor", vendor = "Adjutant Vortus", zone = "The Vindicaar" },
    ["Celestial Grovebush"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Ceremonial Kyrian Standard"] = { method = "Vendor", vendor = "Adjutant Nikos", x = 52.23, y = 47.11, zone = "Bastion" },
    ["Ceremonial Lightforged Standard"] = { method = "Achievement", vendor = "Adjutant Vortus", zone = "The Vindicaar" },

    -- housing.wowdb.com/decor/ pages 13-16.
    ["Chaotic Void Maw"] = { method = "Drop", zone = "March on Quel'Danas" },
    ["Charmed Blisterfang Urn"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Cherished Pet's Rug"] = { method = "Vendor", vendor = "Perry Winkles", x = 53.82, y = 41.70, zone = "Founder's Point", mapID = 2352 },

    ["Chiseled Amani Tablet"] = { method = "Craft" },
    ["Closed Vulpera Scroll"] = { method = "Craft" },
    ["Clumped Asteroidea"] = { method = "Drop", vendor = "Nymrissa Wavecaller", zone = "The Tidebound Grotto" },
    ["Clutch of Ula'tek"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Collector's Tortollan Display Rack"] = { method = "Vendor", vendor = "Taifa", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Color-Curious Candle"] = { method = "Vendor", vendor = "Timicky", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Compact Cookfire"] = { method = "Vendor", vendor = "Taifa", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Confessor's Anima Jar"] = { method = "Vendor", vendor = "Verayn", zone = "Revendreth" , x = 61.93, y = 63.78 },
    ["Corked Bottle of Liquid Mystery"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Corrosive Cache"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Cosmic Void Gravitational Orb"] = { method = "Drop", vendor = "Victorious Stormarion Cache" },
    ["Covered Wooden Desk"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Cozy Bird Nest"] = { method = "Vendor", vendor = "Perry Winkles", x = 53.82, y = 41.70, zone = "Founder's Point", mapID = 2352 },

    ["Cozy Kobold Crate"] = { method = "Vendor", vendor = "Timicky", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Cozy Lightbloom Lilypad"] = { method = "Vendor", vendor = "Perry Winkles", x = 53.82, y = 41.70, zone = "Founder's Point", mapID = 2352 },

    ["Cracked Amani Funerary Urn"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Cracked Vilescar Urn"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Crimson Crystal Column"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Crimson Crystal Core"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Crimson Crystal Fragment"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Crossroads Pet Cage"] = { method = "Vendor", vendor = "Perry Winkles", x = 53.82, y = 41.70, zone = "Founder's Point", mapID = 2352 },


    -- housing.wowdb.com/decor/ pages 17-20 (most of 17-19 is the
    -- "Cuddly ___ Grrgle" series with no published source - skipped except
    -- the few with a real vendor).
    ["Crude Pet Cage"] = { method = "Vendor", vendor = "Perry Winkles", x = 53.82, y = 41.70, zone = "Founder's Point", mapID = 2352 },

    ["Cuddly Alliance Blue Grrgle"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Cuddly Cotton Candy Grrgle"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Cuddly Green Grrgle"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Damaged Nomad's Makeshift Barricade"] = { method = "Vendor", vendor = "Hoarder Jena", x = 57, y = 50, zone = "Vol'dun" },
    ["Decorative Lightforged Holo-Screen"] = { method = "Vendor", vendor = "Adjutant Vortus", zone = "The Vindicaar" },
    ["Demont Orchard Juicer"] = { method = "Vendor", vendor = "\"Den\" Nightshade", x = 39.5, y = 70.2, zone = "Razorwind Shores", mapID = 2351 },

    ["De-Powered Lightforged Siegebreaker"] = { method = "Vendor", vendor = "Zuronar", x = 48, y = 83.2, zone = "Naigtal", },

    -- housing.wowdb.com/decor/ page 21 (pages 22-24+ are internal [DNT]
    -- developer placeholder assets - not real items, skipped entirely).
    ["Destroyed Clutch of Ula'tek"] = { method = "Quest", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Devastator's Brazier"] = { method = "Vendor", vendor = "Tethalash", x = 25.6, y = 33.8, zone = "Valdrakken", mapID = 2112 },

    ["Devouring Ritual Spire"] = { method = "Drop", zone = "The Voidspire" },

    -- housing.wowdb.com/decor/ pages 25-46 are entirely [DNT] developer
    -- placeholder junk (confirmed individually, not skipped blindly) - no
    -- real items there. Page 47 has a handful of real items mixed in:
    ["Domanaar Control Console"] = { method = "Drop", vendor = "Lothraxion", zone = "Nexus-Point Xenas" },
    ["Dormant Brood Egg"] = { method = "Vendor", vendor = "Unknown Vendor", zone = "Silvermoon City", x = 39.29, y = 80.27 },
    ["Dormant Brood Egg Cluster"] = { method = "Vendor", vendor = "Unknown Vendor", zone = "Silvermoon City", x = 39.29, y = 80.27 },
    ["Dormant Clutch of Brood Eggs"] = { method = "Vendor", vendor = "Unknown Vendor", zone = "Silvermoon City", x = 39.29, y = 80.27 },
    ["Dormant Wildseed"] = { method = "Quest", vendor = "Lunelle", zone = "Ardenweald" },

    -- housing.wowdb.com/decor/ pages 49-52 (clean, real content resumed).
    ["Droopy Longwick Rope"] = { method = "Vendor", vendor = "Timicky", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Drustvar Glowcap Cluster"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Drustvar Leaf Clump"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Drustvar Leaf Patch"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Drustvar Shelfcap"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Egg of Ula'tek"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Elaborate Heartsbane Doom Catcher"] = { method = "Vendor", vendor = "Holly Twinklebright", x = 54.26, y = 32.78, zone = "Founder's Point", mapID = 2352 },

    ["Elaborate Karabor Hedge"] = { method = "Vendor", vendor = "Unknown Vendor", zone = "Shadowmoon Valley", x = 58.05, y = 26.64 },
    ["Elegant Elven Washbasin"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Elegant Elven Water Well"] = { method = "Vendor", vendor = "Argan Hammerfist", x = 52.2, y = 37.8, zone = "Founder's Point", mapID = 2352 },

    ["Elegant Enchanted Vanity"] = { method = "Quest" },
    ["Elegant Seat Cushion"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Elegant Storage Table"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },


    -- housing.wowdb.com/decor/ pages 53-56.
    ["Elysian Bulbflower"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Elysian Heart-Lotus"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Elysian Skyfrond"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Embaari Beech Tree"] = { method = "Vendor", vendor = "Unknown Vendor", zone = "Shadowmoon Valley", x = 58.05, y = 26.64 },
    ["Emerald-Encrusted Amani Ritual Skull"] = { method = "Drop", vendor = "Ral'kala" },
    ["Empty Elegant Elven Bathtub"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Empty Reinforced Wooden Barrel"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Empty Tortollan Display Rack"] = { method = "Vendor", vendor = "Taifa", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Ersatz Venom Splatter"] = { method = "Craft" },
    ["Eternally Powered Glowskull"] = { method = "Vendor", vendor = "Holly Twinklebright", x = 54.26, y = 32.78, zone = "Founder's Point", mapID = 2352 },

    ["Everbloom Forest Floor"] = { method = "Drop", vendor = "Yalnu", zone = "The Everbloom" },
    ["Fae Animashroom"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Fae Animashroom Circle"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Fae Anima Wall Lantern"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Fae Lantern Blossom"] = { method = "Vendor", vendor = "Aithlyn", x = 59.5, y = 32.5, zone = "Heart of the Forest" },
    ["Fae Moonbough Cocoon"] = { method = "Vendor", vendor = "Aithlyn", x = 59.5, y = 32.5, zone = "Heart of the Forest" },
    ["Fae Moonbough Gate"] = { method = "Vendor", vendor = "Aithlyn", x = 59.5, y = 32.5, zone = "Heart of the Forest" },
    ["Fae Moonbough Table"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["\"Family Portrait\" Painting"] = { method = "Vendor", vendor = "Corlen Hordralin", zone = "Silvermoon City", x = 44.13, y = 62.76, mapID = 2393 },

    ["Fanged Scaleskin Pouch"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Farmer's Water Trough"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Farstriders' Glory Statue"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },

    ["Farstriders' Pride Statue"] = { method = "Vendor", vendor = "Sathren Azuredawn", x = 43.2, y = 47.5, zone = "Eversong Woods", mapID = 2395 },


    -- housing.wowdb.com/decor/ pages 57-60.
    ["Feathered Ula'tek Talisman"] = { method = "Quest", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Forest Troll Fence"] = { method = "Vendor", vendor = "Griftah", x = 40.2, y = 72.8, zone = "Razorwind Shores", mapID = 2351 },

    ["Forest Troll Fencepost"] = { method = "Vendor", vendor = "Griftah", x = 40.2, y = 72.8, zone = "Razorwind Shores", mapID = 2351 },

    ["Forgotten Amani Urn"] = { method = "Vendor", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Fortified Amani Awning"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, zone = "Silvermoon City", mapID = 2393 },

    ["Fortified Nomad's Makeshift Barricade"] = { method = "Vendor", vendor = "Hoarder Jena", x = 57, y = 50, zone = "Vol'dun" },
    ["Founder's Point Fence"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Fencepost"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Framed Torch"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Gravestone"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Hay Bale"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Lamppost"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Navigation Sign"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Signpost"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Standing Torch"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Street Light"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Founder's Point Street Sign"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Framed Alliance Pride"] = { method = "Vendor", vendor = "Richmond", x = 39.5, y = 59.3, zone = "Silvermoon City" },
    ["Framed Horde Pride"] = { method = "Vendor", vendor = "Richmond", x = 39.5, y = 59.3, zone = "Silvermoon City" },
    ["Framed Moonbrook Quilt"] = { method = "Vendor", vendor = "\"Den\" Nightshade", x = 39.5, y = 70.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Galactic Void-Scarred Banner"] = { method = "Vendor", vendor = "Thraxadar", x = 39.33, y = 80.96, zone = "Masters' Perch", mapID = 2444 },

    -- housing.wowdb.com/decor/ pages 61-64.
    ["Gilded Silvermoon Compass"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Gilded Stonework Altar"] = { method = "Vendor", vendor = "Vindicator Jaelaana", zone = "Antorus, the Burning Throne" },
    ["Gleaming Lightforge"] = { method = "Craft" },
    ["Gleaming Lightforged Grindstone"] = { method = "Vendor", vendor = "Vindicator Jaelaana", zone = "The Vindicaar" },
    ["Gloomshade Glowpod"] = { method = "Vendor", vendor = "Unknown Vendor", zone = "Shadowmoon Valley", x = 58.05, y = 26.64 },
    ["Glowing Zangarshroom Cup"] = { method = "Vendor", vendor = "Throska", zone = "Razorwind Shores" , x = 39.08, y = 74.09, mapID = 2351 },

    ["\"Gnoma Lisa\" Painting"] = { method = "Vendor", vendor = "Rasil Fireborne", x = 43.6, y = 49.2, zone = "Dalaran", mapID = 627 },
    ["Golden Argunite Crystal"] = { method = "Vendor", vendor = "Adjutant Vortus", zone = "The Vindicaar" },
    ["Grand Artificer's Lightforged Console"] = { method = "Vendor", vendor = "Zuronar", x = 48, y = 83.2, zone = "Naigtal" },
    ["Grand Mask of Bwonsamdi, Loa of Graves"] = { method = "Achievement", vendor = "T'lama", x = 36, y = 61, zone = "Zuldazar", mapID = 1164 },
    ["Green Amani Tapestry"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Half-Shell Hot Pot"] = { method = "Vendor", vendor = "Taifa", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Handmade Shen'dorei Pillow"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },


    -- housing.wowdb.com/decor/ pages 65-68.
    ["Hanging Coiled Isle Ropes"] = { method = "Drop", vendor = "The Bargained Crown", zone = "The Venomous Abyss" },
    ["Hanging Dawnflower"] = { method = "Drop", zone = "Delves" },
    ["Hanging Elysian Skyvy"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Hanging Lightforged Standard"] = { method = "Vendor", vendor = "Vindicator Jaelaana", zone = "The Vindicaar" },
    ["Hanging Longwick Rope"] = { method = "Vendor", vendor = "Timicky", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Hanging Mana Brazier"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Hanging Tavern Lantern"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Hanging Wildgrove Ivy"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Hanging Wildseed"] = { method = "Vendor", vendor = "Aithlyn", x = 59.5, y = 32.5, zone = "Heart of the Forest" },
    ["Hanging Yellowed Kelp"] = { method = "Vendor", vendor = "Second Mate Sluggs", x = 51.6, y = 49.8, zone = "The Coiled Isle" },
    ["Harandar Flowering Lamp"] = { method = "Vendor", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },

    ["Harandar Glowvine Lamppost"] = { method = "Vendor", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },

    ["Harandar Glowvine Sconce"] = { method = "Vendor", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },

    ["Haranir Pennant"] = { method = "Vendor", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },

    ["Hatchery of Hissing Eggs"] = { method = "Drop", vendor = "Avatar of Sethraliss", zone = "Temple of Sethraliss" },
    ["Hatred's Wolfpelt Rug"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Hay-Filled Sturdy Feeding Trough"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Heartsbane Banner"] = { method = "Vendor" },
    ["Heartsbane Candle"] = { method = "Vendor", vendor = "Holly Twinklebright", x = 54.26, y = 32.78, zone = "Founder's Point", mapID = 2352 },

    ["Heartsbane Doom Catcher"] = { method = "Vendor", vendor = "Holly Twinklebright", x = 54.26, y = 32.78, zone = "Founder's Point", mapID = 2352 },

    ["Heartsbane Ritual Markings"] = { method = "Vendor", vendor = "Holly Twinklebright", x = 54.26, y = 32.78, zone = "Founder's Point", mapID = 2352 },

    ["Hexed Tomb Brazier"] = { method = "Drop", vendor = "Entombed Sentinels", zone = "The Venomous Abyss" },
    ["Highback Bonewood Chair"] = { method = "Vendor", vendor = "Collector Xorik", zone = "Maldraxxus" , x = 50.82, y = 53.45 },
    ["Highlighting High Light"] = { method = "Vendor", vendor = "Timicky", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["High-Mounted Razorwind Bowl Chandelier"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },


    -- housing.wowdb.com/decor/ pages 69-72.
    ["Iron Candlelight Lantern"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["\"Isolation\" Painting"] = { method = "Vendor", vendor = "Corlen Hordralin", zone = "Silvermoon City", x = 44.13, y = 62.76, mapID = 2393 },

    ["\"Isolation\" Unframed Painting"] = { method = "Vendor", vendor = "Hesta Forlath", x = 44.13, y = 62.76, zone = "Silvermoon City", mapID = 2393 },

    ["Jansen Farm Floral Basket"] = { method = "Vendor", vendor = "\"Den\" Nightshade", x = 39.5, y = 70.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Karabor Beech Tree"] = { method = "Vendor", vendor = "Unknown Vendor", zone = "Shadowmoon Valley", x = 58.05, y = 26.64 },
    ["Karabor Hedge"] = { method = "Vendor", vendor = "Unknown Vendor", zone = "Shadowmoon Valley", x = 58.05, y = 26.64 },
    ["K'areshi Tea Cup"] = { method = "Vendor", vendor = "Throska", zone = "Razorwind Shores" , x = 39.08, y = 74.09, mapID = 2351 },

    ["Kith'ix's Seal"] = { method = "Drop", vendor = "Kith'ix", zone = "Temple of Ula'tek" },
    ["Knotted Hanging Razorwind Ropes"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Kobold Dig-Thing"] = { method = "Vendor", vendor = "Timicky", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Kobold's Hanging Kandles"] = { method = "Quest", vendor = "Morta Gage", x = 42.7, y = 49.8, zone = "Arcantina", mapID = 2541 },

    ["Kobold Sit-Thing"] = { method = "Vendor", vendor = "Timicky", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Kyrian Steward Effigy"] = { method = "Quest", vendor = "Curator Ilaros", zone = "Bastion" },
    ["Kyrian Waymarker"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Kyrian Waymarker Plaque"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Large Founder's Point Gravestone"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },


    -- housing.wowdb.com/decor/ pages 73-76.
    ["Large Ornate Khanam's Rug"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 52.8, y = 37.6, zone = "Founder's Point" },
    ["Large Razorwind Farmer's Hay Pile"] = { method = "Vendor", vendor = "Shon'ja", x = 54.1, y = 59.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Large Threedium Warrens Candle"] = { method = "Vendor", vendor = "Timicky", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Large Triangular Wooden Tile"] = { method = "Vendor", vendor = "Devin Slatesmith", x = 52.1, y = 38.5, zone = "Founder's Point", mapID = 2352 },

    ["Large Warrens Candle"] = { method = "Vendor", vendor = "Timicky", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Large Wooden Floor Tile"] = { method = "Vendor", vendor = "Devin Slatesmith", x = 52.1, y = 38.5, zone = "Founder's Point", mapID = 2352 },

    ["Large Wooden Wall Tile"] = { method = "Vendor", vendor = "Devin Slatesmith", x = 52.1, y = 38.5, zone = "Founder's Point", mapID = 2352 },

    ["Leaning Celestial Orchid"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Leaning Wildgrove Tree"] = { method = "Vendor", vendor = "Aithlyn", x = 59.5, y = 32.5, zone = "Heart of the Forest" },
    ["Lightforged Control Console"] = { method = "Vendor", vendor = "Vindicator Jaelaana", zone = "The Vindicaar" },
    ["Lightforged Holo-Barricade"] = { method = "Vendor", vendor = "Adjutant Vortus", zone = "The Vindicaar" },
    ["Lightforged Holo-Parapet"] = { method = "Vendor", vendor = "Adjutant Vortus", zone = "The Vindicaar" },
    ["Lightforged Holo-Shield"] = { method = "Vendor", vendor = "Adjutant Vortus", zone = "The Vindicaar" },
    ["Lightforged Holo-Tower"] = { method = "Vendor", vendor = "Adjutant Vortus", zone = "The Vindicaar" },
    ["Lightly Adorned Hanging Razorwind Ropes"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Lightveil's Transport Pad"] = { method = "Vendor", vendor = "Zuronar", x = 48, y = 83.2, zone = "Naigtal" },
    ["Long Founder's Point Fence"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Long Hanging Tavern Lantern"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Long Old Founder's Point Fence"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Long Red Vulpera Cushion"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Longwick Rope"] = { method = "Vendor", vendor = "Timicky", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Loose Wisps of Hay"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Lost Explorers' Mailbox"] = { method = "Drop", vendor = "The Lost Explorers", zone = "The Venomous Abyss" },
    ["Lost Tortollan Scroll"] = { method = "Quest", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Lovely Elven Shelf"] = { method = "Quest", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Low-Hanging Razorwind Bowl Chandelier"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Low-Hanging Razorwind Iron Chandelier"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Low-Hanging Razorwind Ropes"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Loyal Companion's Plinth"] = { method = "Vendor", vendor = "Perry Winkles", x = 53.82, y = 41.70, zone = "Founder's Point", mapID = 2352 },

    ["Luminant Defender's Golden Barricade"] = { method = "Vendor", vendor = "Zuronar", x = 48, y = 83.2, zone = "Naigtal" },
    ["Luminant Scout's Golden Fence"] = { method = "Vendor", vendor = "Zuronar", x = 48, y = 83.2, zone = "Naigtal" },
    ["Luminant Soldier's War Banner"] = { method = "Vendor", vendor = "Zuronar", x = 48, y = 83.2, zone = "Naigtal", },
    ["Luminous Rotshroom"] = { method = "Drop", vendor = "Rotmire", zone = "Sporefall" },

    -- housing.wowdb.com/decor/ pages 77-80.
    ["Lunarfall Beech Tree"] = { method = "Vendor", vendor = "Unknown Vendor", zone = "Shadowmoon Valley", x = 58.05, y = 26.64 },
    ["Lush Celestial Moonbough"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Lush Drustvar Witchfern"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Lush Elysian Bellflower Bush"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Lush Elysian Lily"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Lush Elysian Lotus"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Lush Wildgrove Fern"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Maldraxxi Anima Crystal"] = { method = "Vendor", vendor = "Nalcorn Talsen", x = 50.8, y = 53.4, zone = "Maldraxxus" },
    ["Maldraxxi Horned Beast Skull"] = { method = "Vendor", vendor = "Collector Xorik", zone = "Maldraxxus" , x = 50.82, y = 53.45 },
    ["Maldraxxi Shielding Lattice"] = { method = "Quest", vendor = "Collector Xorik", zone = "Maldraxxus" },
    ["March on Quel'Danas Vanquisher's Argent Trophy"] = { method = "Drop", vendor = "Midnight Falls", zone = "March on Quel'Danas" },
    ["March on Quel'Danas Vanquisher's Aureate Trophy"] = { method = "Drop", vendor = "Midnight Falls", zone = "March on Quel'Danas" },
    ["March on Quel'Danas Vanquisher's Gleaming Trophy"] = { method = "Drop", vendor = "Midnight Falls", zone = "March on Quel'Danas" },
    ["Maruukai Barricade"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 52.8, y = 37.6, zone = "Founder's Point" },
    ["Maruukai Chef's Stove"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 52.8, y = 37.6, zone = "Founder's Point" },
    ["Maruukai Feast Table"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 52.8, y = 37.6, zone = "Founder's Point" },
    ["Maruukai Storage Basket"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 52.8, y = 37.6, zone = "Founder's Point" },
    ["Maruukai Wooden Table"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 54.2, y = 56.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Mason's Tortollan Display Rack"] = { method = "Vendor", vendor = "Taifa", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Mature Star Lily"] = { method = "Vendor", vendor = "Unknown Vendor", zone = "Shadowmoon Valley", x = 58.05, y = 26.64 },
    ["Maxwell Stables Saddle"] = { method = "Vendor", vendor = "\"Den\" Nightshade", x = 39.5, y = 70.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Medium Warrens Candle"] = { method = "Vendor", vendor = "Timicky", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Midnight Alchemist's Shop Sign"] = { method = "Achievement", vendor = "Melaris", x = 47.0, y = 51.8, zone = "Silvermoon City", mapID = 2393 },

    ["Midnight Blacksmith's Shop Sign"] = { method = "Achievement", vendor = "Eriden", x = 43.6, y = 51.4, zone = "Silvermoon City", mapID = 2393 },

    ["Midnight Cook's Shop Sign"] = { method = "Achievement", vendor = "Quelis", x = 56.2, y = 69.8, zone = "Silvermoon City", mapID = 2393 },

    ["Midnight Enchanter's Shop Sign"] = { method = "Achievement", vendor = "Lyna", x = 47.8, y = 53.4, zone = "Silvermoon City", mapID = 2393 },

    ["Midnight Engineer's Shop Sign"] = { method = "Achievement", vendor = "Yatheon", x = 43.4, y = 53.8, zone = "Silvermoon City", mapID = 2393 },

    ["Midnight Fisher's Shop Sign"] = { method = "Achievement", vendor = "Mowaia", x = 52.2, y = 54, zone = "Harandar", mapID = 2413 },

    ["Midnight Herbalist's Shop Sign"] = { method = "Achievement", vendor = "Irodalmin", x = 48.2, y = 51.4, zone = "Silvermoon City", mapID = 2393 },

    ["Midnight Jewelcrafter's Shop Sign"] = { method = "Achievement", vendor = "Amwa'ana", x = 52.6, y = 50.8, zone = "Harandar", mapID = 2413 },

    ["Midnight Leatherworker's Shop Sign"] = { method = "Achievement", vendor = "Jan'zel", x = 45.2, y = 69.8, zone = "Zul'Aman" },
    ["Midnight Miner's Shop Sign"] = { method = "Achievement", vendor = "Hawli", x = 52.6, y = 50.6, zone = "Harandar", mapID = 2413 },

    ["Midnight Scribe's Shop Sign"] = { method = "Achievement", vendor = "Lelorian", x = 46.6, y = 51.4, zone = "Silvermoon City", mapID = 2393 },

    ["Midnight Skinner's Shop Sign"] = { method = "Achievement", vendor = "Kuvahn", x = 45.2, y = 69.8, zone = "Zul'Aman", mapID = 2437 },

    ["Midnight Tailor's Shop Sign"] = { method = "Achievement", vendor = "Deynna", x = 48.2, y = 54.2, zone = "Silvermoon City", mapID = 2393 },

    ["Molsen Farm Corn Row"] = { method = "Vendor", vendor = "\"Den\" Nightshade", x = 39.5, y = 70.2, zone = "Razorwind Shores", mapID = 2351 },


    -- housing.wowdb.com/decor/ pages 81-84.
    ["Mounted Founder's Point Lantern"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Mounted Tavern Lantern"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Mysterious Imported Piranha"] = { method = "Vendor", vendor = "Acquirer Ta'gosh", zone = "Revendreth" , x = 61.4, y = 70.8 },
    ["Mysterious Sin'dorei Candlestick"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Narrow Kyrian Drapes"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Nathrian Window"] = { method = "Vendor", vendor = "Mistress Mihaela", x = 61.33, y = 63.73, zone = "Revendreth" },
    ["Naturally Elegant Doormat"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Nomad's Bowl Set"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Covered Serving Bowl"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Mortar and Pestle"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Refreshment Set"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Serving Bowl"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Serving Sundries"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Steel Lantern"] = { method = "Vendor", vendor = "Hoarder Jena", x = 57, y = 50, zone = "Vol'dun" },
    ["Nomad's Stone Pitcher"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Stone Urn"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Warped Water Gourd"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Water Gourd"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Wooden Lamppost"] = { method = "Vendor", vendor = "Hoarder Jena", x = 57, y = 50, zone = "Vol'dun" },
    ["Nomad's Wooden Table"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Nomad's Worn Water Gourd"] = { method = "Vendor", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Ominous Heartsbane Banner"] = { method = "Vendor", vendor = "Holly Twinklebright", x = 54.26, y = 32.78, zone = "Founder's Point", mapID = 2352 },

    ["Open Bonewood Barrel"] = { method = "Vendor", vendor = "Collector Xorik", zone = "Maldraxxus" , x = 50.82, y = 53.45 },

    -- housing.wowdb.com/decor/ pages 85-88.
    ["Open Fungal Jar"] = { method = "Vendor", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },

    ["Open Maruukai Storage Basket"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 54.2, y = 56.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Open Serpentine Reliquary"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Open Sturdy Wooden Crate"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Ornate Cosmic Banner"] = { method = "Vendor", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Ornate Elven Stove"] = { method = "Vendor", vendor = "Balen Starfinder", x = 53.2, y = 37.82, zone = "Founder's Point", mapID = 2352 },

    ["Ornate Khanam's Rug"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 54.2, y = 56.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Ornate Kyrian Glass Platform"] = { method = "Vendor", vendor = "Adjutant Nikos", x = 52.23, y = 47.11, zone = "Bastion" },
    ["Ornate Sin'dorei Sconce"] = { method = "Quest", vendor = "Nael Silvertongue", x = 50.6, y = 56.2, zone = "Silvermoon City", mapID = 2393 },

    ["Ornate Vulpera Caravan"] = { method = "Quest", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Ossified Maldraxxi Spike"] = { method = "Vendor", vendor = "Collector Xorik", zone = "Maldraxxus" , x = 50.82, y = 53.45 },

    -- housing.wowdb.com/decor/ pages 89-92.
    ["Paw Pal Bed"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Paw Pal Bed and Blanket"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Paw Pal Dog House Durotar Roof"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Paw Pal Dog House Elwynn Roof"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Paw Pal Dog House Eversong Roof"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Paw Pal Dog House Frame"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Paw Pal Dog House Shadowglen Roof"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Paw Pal Water Dish"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Perch of the Dawnfire Phoenix"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Pet Food and Water Tray"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 54.2, y = 56.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Pillar of the Coiled Isle"] = { method = "Drop", zone = "The Venomous Abyss" },
    ["Pillar of the Fanged Altar"] = { method = "Drop", zone = "Altar of Fangs" },
    ["Plain Hanging Razorwind Ropes"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Preyhunter's Fanged Bust"] = { method = "Drop", vendor = "Ral'kala" },
    ["Preyhunter's Fanged Effigy"] = { method = "Achievement", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyhunter's Scaled Bust"] = { method = "Drop", vendor = "Ral'kala" },
    ["Preyhunter's Scaled Effigy"] = { method = "Achievement", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyhunter's Terror Bust"] = { method = "Achievement", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Preyhunter's Terror Effigy"] = { method = "Achievement", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["\"Pride of Stormwind\" Statue"] = { method = "Vendor", vendor = "Captain Lancy Revshon", x = 67.6, y = 72.8, zone = "Stormwind City", mapID = 84 },

    ["Prime Evil's Chest"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Prized Orb of Azeroth"] = { method = "Vendor", vendor = "Richmond", x = 39.5, y = 59.3, zone = "Silvermoon City" },
    ["Protected Tortollan Scroll Case"] = { method = "Vendor", vendor = "Taifa", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Pungent Atal'Utek Shroom"] = { method = "Vendor", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Purified Ancient Urn"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Crude Axe"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Crude Hammer"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Dracthyr Stein"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Earthen Pot"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Elven Glowlamp"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Elven Mirror"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Floating Lantern"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Folk Candle"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Folk Mirror"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Goblin Cup"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Kaldorei Candle"] = { method = "Quest", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", mapID = 2352 },


    -- housing.wowdb.com/decor/ pages 93-96.
    ["Purified Sin'dorei Candle"] = { method = "Vendor", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Tauren Pot"] = { method = "Vendor", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Troll Amulet"] = { method = "Vendor", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Troll Loop"] = { method = "Vendor", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Troll Pendant"] = { method = "Vendor", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Troll Pitcher"] = { method = "Vendor", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Troll Ring"] = { method = "Vendor", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Purified Troll Urn"] = { method = "Vendor", vendor = "Cursed Keepsake", x = 52.6, y = 37.6, zone = "Founder's Point", hordeVendor = "Cursed Keepsake", hordeZone = "Razorwind Shores", hordeX = 53.7, hordeY = 57.4, mapID = 2352, hordeMapID = 2351 },

    ["Radiant Elysian Water Lily"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["\"Rage of the Shackled\" Mural"] = { method = "Drop", vendor = "Ula'tek", zone = "The Venomous Abyss" },
    ["Razorwind Banded Planter"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Banner Pelt"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Bowl Chandelier"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Campfire Grill"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Construction Crane"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Crafter's Chisel"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Farmer's Hay Pile"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Fisher's Rack"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Fishing Net"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Iron Chandelier"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Logger's Axe"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Miner's Pickaxe"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Peon's Shovel"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind River Paddle"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Roofer's Shingle"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Roofer's Shingle Pile"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Shores Canoe"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Smith's Hammer"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Standing Tusk"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Razorwind Wheelbarrow"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Razorwind Woodworker's Hand Saw"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["\"Reclamation\" Painting"] = { method = "Vendor", vendor = "Corlen Hordralin", zone = "Silvermoon City", x = 44.13, y = 62.76, mapID = 2393 },

    ["\"Reclamation\" Unframed Painting"] = { method = "Vendor", vendor = "Hesta Forlath", x = 44.13, y = 62.76, zone = "Silvermoon City", mapID = 2393 },

    ["Reinforced Empyrium Tile"] = { method = "Vendor", vendor = "Vindicator Jaelaana", zone = "Antorus, the Burning Throne" },
    ["Reinforced Nomad's Makeshift Barricade"] = { method = "Vendor", vendor = "Hoarder Jena", x = 57, y = 50, zone = "Vol'dun" },

    -- housing.wowdb.com/decor/ pages 97-100.
    ["Replica Crown of the Triumvirate"] = { method = "Quest", vendor = "Adjutant Vortus", zone = "Antorus, the Burning Throne" },
    ["Restored Night Fae Sigil"] = { method = "Achievement", vendor = "Lunelle", zone = "Heart of the Forest" },
    ["Revendreth Sinner's Prison"] = { method = "Vendor", vendor = "Mistress Mihaela", x = 61.33, y = 63.73, zone = "Revendreth" },
    ["\"Rising Glory of Rukhmar\" Statue"] = { method = "Quest", vendor = "Ruuan the Seer", x = 46.6, y = 45, zone = "Spires of Arak", mapID = 542 },

    ["Ritual Embaari Arch"] = { method = "Vendor", vendor = "Vindicator Nuurem", zone = "Stormshield", x = 46.34, y = 76.55, mapID = 622 },

    ["\"River's Protectors\" Painting"] = { method = "Vendor", vendor = "Corlen Hordralin", zone = "Silvermoon City", x = 44.13, y = 62.76, mapID = 2393 },

    ["\"River's Protectors\" Unframed Painting"] = { method = "Vendor", vendor = "Hesta Forlath", x = 44.13, y = 62.76, zone = "Silvermoon City", mapID = 2393 },

    ["Rolled Razorwind Leathers"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Royal Attendant's Coffin"] = { method = "Drop", zone = "Kings' Rest" },
    ["Runed Stone Placard"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Runic Kyrian Reliquary"] = { method = "Achievement", vendor = "Curator Ilaros", zone = "Bastion" },
    ["Rustic Fishing Rack"] = { method = "Vendor", vendor = "Second Mate Sluggs", x = 51.6, y = 49.8, zone = "The Coiled Isle" },
    ["Rutaani Birdbath"] = { method = "Vendor", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },

    ["Rutaani Birdfeeder"] = { method = "Vendor", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },

    ["Rutaani Bird Perch"] = { method = "Vendor", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },

    ["Sanctuary Chess Dark Bishop"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary Chess Dark King"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary Chess Dark Knight"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary Chess Dark Pawn"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary Chess Dark Queen"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary Chess Dark Rook"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary Chess Light Bishop"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary Chess Light King"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary Chess Light Knight"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary Chess Light Pawn"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary Chess Light Queen"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },


    -- housing.wowdb.com/decor/ pages 101-104.
    ["Sanctuary Chess Light Rook"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary's Chess Board"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary's Chess Match"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sanctuary's Horadric Cube"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Scarlet Drustvar Oak"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Scarlet Drustvar Thornwood"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Sea Glass Bauble"] = { method = "Vendor", vendor = "Taifa", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Sea Glass Lamp Post"] = { method = "Vendor", vendor = "Taifa", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Sealeather Sack"] = { method = "Vendor", vendor = "Taifa", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Sealed Fungal Jar"] = { method = "Vendor", vendor = "Naynar", x = 50.95, y = 50.74, zone = "Harandar", mapID = 2413 },

    ["Sealed Serpentine Reliquary"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Sentinel Hill Picnic Table"] = { method = "Vendor", vendor = "\"Den\" Nightshade", x = 39.5, y = 70.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Sentinel Hill Rocking Chair"] = { method = "Vendor", vendor = "\"Den\" Nightshade", x = 39.5, y = 70.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Serpent-Caller Spike"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Shen'dorei Standard"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Shielded Lightforged Pylon"] = { method = "Achievement", vendor = "Adjutant Vortus", zone = "The Vindicaar" },
    ["Short Corked Bottle of Liquid Mystery"] = { method = "Drop", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Short Crimson Oak Stump"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Short Drustvar Oak Stump"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Short Hanging Tavern Lantern"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["Short Round Wooden Column"] = { method = "Vendor", vendor = "Devin Slatesmith", x = 52.1, y = 38.5, zone = "Founder's Point", mapID = 2352 },

    ["Short Square Wooden Column"] = { method = "Vendor", vendor = "Devin Slatesmith", x = 52.1, y = 38.5, zone = "Founder's Point", mapID = 2352 },

    ["Shrine of Akil'zon, Loa of Victory"] = { method = "Vendor", vendor = "Griftah", x = 40.2, y = 72.8, zone = "Razorwind Shores", mapID = 2351 },

    ["Shrine of Halazzi, Loa of the Hunt"] = { method = "Vendor", vendor = "Griftah", x = 40.2, y = 72.8, zone = "Razorwind Shores", mapID = 2351 },

    ["Shrine of Jan'alai, Loa of Fire"] = { method = "Vendor", vendor = "Griftah", x = 62.5, y = 79.2, zone = "Founder's Point", mapID = 2352 },

    ["Shrine of Nalorakk, Loa of War"] = { method = "Vendor", vendor = "Griftah", x = 62.5, y = 79.2, zone = "Founder's Point", mapID = 2352 },


    -- housing.wowdb.com/decor/ pages 105-108.
    ["Silvermoon Dragonhawk Incubator"] = { method = "Vendor", vendor = "Perry Winkles", x = 53.82, y = 41.70, zone = "Founder's Point", mapID = 2352 },

    ["\"Silvermoon in Summer\" Painting"] = { method = "Vendor", vendor = "Corlen Hordralin", zone = "Silvermoon City", x = 44.13, y = 62.76, mapID = 2393 },

    ["Silvermoon Privacy Screen"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Simple Hallow's End Candle"] = { method = "Vendor", vendor = "Holly Twinklebright", x = 54.26, y = 32.78, zone = "Founder's Point", mapID = 2352 },

    ["Sinfall Arched Bookcase"] = { method = "Vendor", vendor = "Verayn", zone = "Revendreth" , x = 61.93, y = 63.78 },
    ["Sinfall Dining Table"] = { method = "Vendor", vendor = "Verayn", zone = "Revendreth" , x = 61.93, y = 63.78 },
    ["Sinner's Gibbet"] = { method = "Vendor", vendor = "Mistress Mihaela", x = 61.33, y = 63.73, zone = "Revendreth" },
    ["Skyreach Circular Table"] = { method = "Drop", vendor = "High Sage Viryx", zone = "Skyreach" },
    ["Small Darkhaven Window"] = { method = "Vendor", vendor = "Mistress Mihaela", x = 61.33, y = 63.73, zone = "Revendreth" },
    ["Small Founder's Point Gravestone"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },


    -- housing.wowdb.com/decor/ pages 109-112.
    ["Small Shimmering Moonvine"] = { method = "Vendor", vendor = "Aithlyn", x = 59.5, y = 32.5, zone = "Heart of the Forest" },
    ["Small Warrens Candle"] = { method = "Vendor", vendor = "Timicky", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Snowbound Highroad Pine"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Soulcoiler Canopy"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Soulcoiler Jaw"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Soulcoiler Sconce"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Soulcoiler Skull"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Soulcoiler's Ritual Candle"] = { method = "Drop", vendor = "Nek'zali the Soulcoiler", zone = "The Venomous Abyss" },
    ["Sparse Elysian Pondweed"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Spiral Wooden Stairs"] = { method = "Vendor", vendor = "Devin Slatesmith", x = 52.1, y = 38.5, zone = "Founder's Point", mapID = 2352 },

    ["Spirit-Touched Amani Mask"] = { method = "Drop", zone = "Delves" },
    ["Spooky Scarecrow"] = { method = "Vendor", vendor = "Holly Twinklebright", x = 54.26, y = 32.78, zone = "Founder's Point", mapID = 2352 },

    ["Stack of Kafa Mugs"] = { method = "Vendor", vendor = "Cousin Shortkaf", x = 55.2, y = 62.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Standing Argunite Lamp"] = { method = "Vendor", vendor = "Vindicator Jaelaana", zone = "The Vindicaar" },
    ["Starseed Sapling"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Steamy Romance Tablet"] = { method = "Vendor", vendor = "Griftah", x = 40.2, y = 72.8, zone = "Razorwind Shores", mapID = 2351 },

    ["Stitched Blisterfang Bag"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },


    -- housing.wowdb.com/decor/ pages 113-116.
    ["Stonecarved Sin'dorei Jar"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Sturdy Feeding Trough"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Sturdy Portable Ice Chest"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Sturdy Silvermoon Crate"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Sturdy Silvermoon Crate Lid"] = { method = "Vendor", vendor = "Construct Ali'a", x = 55.8, y = 65.8, zone = "Silvermoon City", mapID = 2393 },

    ["Sturdy Wooden Desk"] = { method = "Vendor", vendor = "Xiao Dan", zone = "Founder's Point", x = 52.0, y = 38.3, mapID = 2352 },

    ["\"Summoning of Ula'tek\" Mural"] = { method = "Quest", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Sunstrider Omnium Simulacrum"] = { method = "Achievement", vendor = "Rae'ana", x = 47.8, y = 82, zone = "Silvermoon City", mapID = 2022 },

    -- housing.wowdb.com/decor/ pages 117-120.
    ["Suspended Lich Scroll"] = { method = "Vendor", vendor = "Nalcorn Talsen", x = 50.8, y = 53.4, zone = "Maldraxxus" },
    ["Tall Crimson Oak"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Tall Founder's Point Gravestone"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Tall Round Wooden Column"] = { method = "Vendor", vendor = "Devin Slatesmith", zone = "Founder's Point", x = 52.1, y = 38.5, hordeVendor = "Merki", hordeZone = "Razorwind Shores", hordeX = 54.0, hordeY = 59.0, mapID = 2352, hordeMapID = 2351 },

    ["Tall Square Wooden Column"] = { method = "Vendor", vendor = "Devin Slatesmith", zone = "Founder's Point", x = 52.1, y = 38.5, hordeVendor = "Merki", hordeZone = "Razorwind Shores", hordeX = 54.0, hordeY = 59.0, mapID = 2352, hordeMapID = 2351 },

    ["\"The Fallen Protectors\" Painting"] = { method = "Vendor", vendor = "Corlen Hordralin", zone = "Silvermoon City", x = 44.13, y = 62.76, mapID = 2393 },

    ["\"The Fallen Protectors\" Unframed Painting"] = { method = "Vendor", vendor = "Hesta Forlath", x = 44.13, y = 62.76, zone = "Silvermoon City", mapID = 2393 },

    ["\"The Hunger Awakens\" Mural"] = { method = "Quest", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["\"The Last Day of the Semester\" Painting"] = { method = "Vendor", vendor = "Corlen Hordralin", zone = "Silvermoon City", x = 44.13, y = 62.76, mapID = 2393 },

    ["\"The Light Blooms\" Painting"] = { method = "Vendor", vendor = "Corlen Hordralin", zone = "Silvermoon City", x = 44.13, y = 62.76, mapID = 2393 },

    ["\"The Light Blooms\" Unframed Painting"] = { method = "Vendor", vendor = "Hesta Forlath", x = 44.13, y = 62.76, zone = "Silvermoon City", mapID = 2393 },

    ["The Venomous Abyss Argent Trophy"] = { method = "Drop", vendor = "Ula'tek", zone = "The Venomous Abyss" },
    ["The Venomous Abyss Aureate Trophy"] = { method = "Drop", vendor = "Ula'tek", zone = "The Venomous Abyss" },
    ["The Venomous Abyss Gleaming Trophy"] = { method = "Drop", vendor = "Ula'tek", zone = "The Venomous Abyss" },
    ["Tied-Left Leather Curtains"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },


    -- housing.wowdb.com/decor/ pages 121-124.
    ["Tome of Kings"] = { method = "Achievement", vendor = "Lali the Assistant", x = 82.8, y = 30.4, zone = "Vale of Eternal Blossoms", mapID = 390 },

    ["Torquewrench Tractor"] = { method = "Vendor", vendor = "\"Den\" Nightshade", x = 39.5, y = 70.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Tortollan Scholar Satchel"] = { method = "Quest", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Tortollan Tarp Tent"] = { method = "Vendor", vendor = "Taifa", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Tortollan Traveler's Chest"] = { method = "Vendor", vendor = "Taifa", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Tortollan Traveler's Tincture"] = { method = "Vendor", vendor = "Taifa", x = 54.8, y = 57.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Traditional Brewfest Banner"] = { method = "Vendor", vendor = "Dizzy Alechux", x = 40.3, y = 17.3, zone = "Durotar" },
    ["Traditional Brewfest Stein"] = { method = "Vendor", vendor = "Dizzy Alechux", x = 40.3, y = 17.3, zone = "Durotar" },
    ["Traditional Tortollan Tent"] = { method = "Vendor", vendor = "Second Mate Sluggs", x = 51.6, y = 49.8, zone = "The Coiled Isle" },
    ["Trampled Wisps of Hay"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Tusk-Adorned Stitched Rug"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Tusked Amani Canoe"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Tusked Hanging Razorwind Ropes"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Tusked Leather Tapestry"] = { method = "Vendor", vendor = "Gronthul", x = 54.1, y = 59.1, zone = "Razorwind Shores", mapID = 2351 },

    ["Twilight Brazier"] = { method = "Quest", vendor = "Tajaka Sawtusk", x = 46, y = 66, zone = "Zul'Aman", mapID = 2437 },

    ["Twisted Crimson Root"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Twisted Rope Coil"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 62.4, y = 80.0, zone = "Razorwind Shores", mapID = 2351 },

    ["Ula'tek Ritual Monolith"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Ula'tek Ritual Stone"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, zone = "Silvermoon City", mapID = 2393 },

    ["Unearthed Amani Sarcophagus Base"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Unearthed Amani Sarcophagus Lid"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Vacant Buzzard Roost"] = { method = "Vendor", vendor = "Hoarder Jena", x = 57, y = 50, zone = "Vol'dun" },

    -- housing.wowdb.com/decor/ pages 125-128.
    ["Venombound Ropes"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Venomjade Necklace"] = { method = "Vendor", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Venomous Defender's Barricade"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Venomous Globule"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Venomous Tendril"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Venomous Thread"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Venom Scholar's Focus"] = { method = "Vendor", vendor = "Skull of Er'inye", x = 51.0, y = 62.4, zone = "Vaults of Atal'Utek", mapID = 2509 },

    ["Venthyr Fence"] = { method = "Vendor", vendor = "Verayn", zone = "Revendreth" , x = 61.93, y = 63.78 },
    ["Venthyr Fencepost"] = { method = "Vendor", vendor = "Verayn", zone = "Revendreth" , x = 61.93, y = 63.78 },
    ["Verdant Elysian Crownblossom"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Very Reliable Undermine Lamppost"] = { method = "Drop", zone = "Undermine" },
    ["Vessel of the Howling Ossuary"] = { method = "Drop", vendor = "Sszorak", zone = "The Venomous Abyss" },
    ["Vilescar Weapon Rack"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Void Elf Round Table"] = { method = "Drop", zone = "Slayer's Rise" },
    ["Void Elf Throne"] = { method = "Vendor", vendor = "Void Researcher Anomander", x = 52.57, y = 72.89, zone = "Voidstorm", mapID = 2405 },

    ["Void Elf Torch"] = { method = "Drop", zone = "Voidstorm" },
    ["Voidflame Candle"] = { method = "Vendor", vendor = "Rae'ana", x = 47.8, y = 82, zone = "Silvermoon City", mapID = 2022 },
    ["Voidspire Vanquisher's Argent Trophy"] = { method = "Drop", vendor = "Crown of the Cosmos", zone = "The Voidspire" },
    ["Voidspire Vanquisher's Aureate Trophy"] = { method = "Drop", vendor = "Crown of the Cosmos", zone = "The Voidspire" },
    ["Voidspire Vanquisher's Gleaming Trophy"] = { method = "Drop", vendor = "Crown of the Cosmos", zone = "The Voidspire" },
    ["Vulpera Postbox"] = { method = "Vendor", vendor = "Hoarder Jena", x = 57, y = 50, zone = "Vol'dun" },
    ["Vulpera War Banner"] = { method = "Quest", vendor = "Jeni", x = 56.4, y = 50.4, zone = "Vol'dun" },
    ["Warrens Candlecooker"] = { method = "Vendor", vendor = "Timicky", x = 53, y = 38.2, zone = "Founder's Point", mapID = 2352 },

    ["Westfall Farmer's Shed"] = { method = "Vendor", vendor = "\"Den\" Nightshade", x = 39.5, y = 70.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Westfall Harvest Lamp"] = { method = "Vendor", vendor = "\"Den\" Nightshade", x = 39.5, y = 70.2, zone = "Razorwind Shores", mapID = 2351 },

    ["Westfall Pet Cage"] = { method = "Vendor", vendor = "Perry Winkles", x = 53.82, y = 41.70, zone = "Founder's Point", mapID = 2352 },


    -- housing.wowdb.com/decor/ pages 129-132 (the last of the 132 pages).
    ["Wide Maruukai Barricade"] = { method = "Vendor", vendor = "Roshai Lightstep", x = 52.8, y = 37.6, zone = "Founder's Point" },
    ["Wide Wooden Staircase"] = { method = "Vendor", vendor = "Devin Slatesmith", x = 52.1, y = 38.5, zone = "Founder's Point", mapID = 2352 },

    ["Wildgrove Leaf Pile"] = { method = "Vendor", vendor = "Lunelle", zone = "Heart of the Forest" , x = 45.2, y = 56.6 },
    ["Wild Violet Bellflowers"] = { method = "Vendor", vendor = "Trevor Grenner", x = 53.4, y = 40.8, zone = "Founder's Point", mapID = 2352 },

    ["Windblown Wisps of Hay"] = { method = "Vendor", vendor = "\"Len\" Splinthoof", x = 39.91, y = 73.31, zone = "Founder's Point", mapID = 2352 },

    ["Windshaper's Chimes"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Windswept Elysian Grass"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Windswept Elysian Shrub"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Windswept Elysian Skyplume"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Windswept Elysian Willow"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Windwell"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Winged Elysian Spiralbloom"] = { method = "Vendor", vendor = "Curator Ilaros", zone = "Bastion" , x = 52.48, y = 48.02 },
    ["Witch Doctor's Punch Bowl"] = { method = "Vendor", vendor = "Griftah", x = 62.5, y = 79.2, zone = "Founder's Point", mapID = 2352 },

    ["Withered Barrow-weed"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Withered Crimson Oak"] = { method = "Vendor", vendor = "Fenwir", zone = "Drustvar" , x = 37.77, y = 48.94 },
    ["Wooden Planter Pot"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Wooden Planter Row"] = { method = "Vendor", vendor = "Faarden the Builder", x = 51.99, y = 38.42, zone = "Founder's Point", mapID = 2352 },

    ["Wooden Vulpera Caravan"] = { method = "Vendor", vendor = "Hoarder Jena", x = 57, y = 50, zone = "Vol'dun" },
    ["Worn Amani Oar"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Woven Forest Troll Rug"] = { method = "Vendor", vendor = "Griftah", x = 62.5, y = 79.2, zone = "Founder's Point", mapID = 2352 },

    ["Wrapped Scaleskin Urn"] = { method = "Vendor", vendor = "Jan'sari the Watchful", x = 58.77, y = 45.97, zone = "The Coiled Isle", mapID = 2512 },

    ["Yellowed Kelp Pile"] = { method = "Vendor", vendor = "Second Mate Sluggs", x = 51.6, y = 49.8, zone = "The Coiled Isle" },
    ["Zandalari Bottle Shipment"] = { method = "Craft" },
    ["Zapmaster Viewer 3000"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Zephras Drapery"] = { method = "Vendor", vendor = "Dennia Silvertongue", x = 51, y = 56.4, zone = "Silvermoon City", mapID = 2393 },

    ["Zul'Aman Brazier Post"] = { method = "Vendor", vendor = "Telemancer Astrandis", x = 52.4, y = 78.8, zone = "Silvermoon City", mapID = 2393 },

    ["Zul'Aman Burning Pinecone"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Zul'Aman Creeping Pangoroot"] = { method = "Vendor", vendor = "Naleidea Rivergleam", x = 52.00, y = 77.46, zone = "Silvermoon City", mapID = 2393 },

    ["Zul'Aman Pine Tree"] = { method = "Quest", vendor = "Firetender Zab'ni", x = 58.6, y = 45.9, zone = "The Coiled Isle", mapID = 2512 },

    ["Zul'Aman Swamp Palm Sprout"] = { method = "Drop", zone = "Delves" },
}
