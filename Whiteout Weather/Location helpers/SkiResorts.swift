//
//  SkiResorts.swift
//  Whiteout Weather
//
//  Named ski area → coordinate lookup for WA, OR, ID, MT, UT.

internal import CoreLocation

struct SkiResort {
    let name: String
    let state: String
    let coordinate: CLLocationCoordinate2D
}

let skiResorts: [SkiResort] = [

    // MARK: Alaska
    SkiResort(name: "Alyeska Resort",       state: "AK", coordinate: .init(latitude: 60.9699, longitude: -149.0900)),
    SkiResort(name: "Arctic Valley",        state: "AK", coordinate: .init(latitude: 61.2480, longitude: -149.5088)),
    SkiResort(name: "Eaglecrest",           state: "AK", coordinate: .init(latitude: 58.2750, longitude: -134.5010)),
    SkiResort(name: "Hilltop Ski Area",     state: "AK", coordinate: .init(latitude: 61.1097, longitude: -149.6820)),

    // MARK: Arizona
    SkiResort(name: "Arizona Snowbowl",     state: "AZ", coordinate: .init(latitude: 35.3300, longitude: -111.7050)),
    SkiResort(name: "Sunrise Park Resort",  state: "AZ", coordinate: .init(latitude: 34.0120, longitude: -109.5630)),

    // MARK: California
    SkiResort(name: "Alpine Meadows",       state: "CA", coordinate: .init(latitude: 39.1660, longitude: -120.2380)),
    SkiResort(name: "Badger Pass",          state: "CA", coordinate: .init(latitude: 37.6625, longitude: -119.6635)),
    SkiResort(name: "Bear Mountain",        state: "CA", coordinate: .init(latitude: 34.2310, longitude: -116.8600)),
    SkiResort(name: "Boreal Mountain",      state: "CA", coordinate: .init(latitude: 39.3330, longitude: -120.3490)),
    SkiResort(name: "China Peak",           state: "CA", coordinate: .init(latitude: 37.2360, longitude: -119.1570)),
    SkiResort(name: "Dodge Ridge",          state: "CA", coordinate: .init(latitude: 38.1890, longitude: -119.9550)),
    SkiResort(name: "Donner Ski Ranch",     state: "CA", coordinate: .init(latitude: 39.3180, longitude: -120.3820)),
    SkiResort(name: "Granlibakken",         state: "CA", coordinate: .init(latitude: 39.1550, longitude: -120.1450)),
    SkiResort(name: "Heavenly",             state: "CA", coordinate: .init(latitude: 38.9350, longitude: -119.9400)),
    SkiResort(name: "Homewood",             state: "CA", coordinate: .init(latitude: 39.0850, longitude: -120.1600)),
    SkiResort(name: "June Mountain",        state: "CA", coordinate: .init(latitude: 37.7670, longitude: -119.0910)),
    SkiResort(name: "Kirkwood",             state: "CA", coordinate: .init(latitude: 38.6840, longitude: -120.0650)),
    SkiResort(name: "Mammoth Mountain",     state: "CA", coordinate: .init(latitude: 37.6300, longitude: -119.0320)),
    SkiResort(name: "Mt. Baldy",            state: "CA", coordinate: .init(latitude: 34.2360, longitude: -117.6580)),
    SkiResort(name: "Mt. Shasta Ski Park",  state: "CA", coordinate: .init(latitude: 41.3140, longitude: -122.1950)),
    SkiResort(name: "Northstar",            state: "CA", coordinate: .init(latitude: 39.2750, longitude: -120.1210)),
    SkiResort(name: "Palisades Tahoe",      state: "CA", coordinate: .init(latitude: 39.1970, longitude: -120.2350)),
    SkiResort(name: "Sierra-at-Tahoe",      state: "CA", coordinate: .init(latitude: 38.7990, longitude: -120.0800)),
    SkiResort(name: "Snow Summit",          state: "CA", coordinate: .init(latitude: 34.2360, longitude: -116.8890)),
    SkiResort(name: "Soda Springs",         state: "CA", coordinate: .init(latitude: 39.3220, longitude: -120.3790)),
    SkiResort(name: "Tahoe Donner",         state: "CA", coordinate: .init(latitude: 39.3420, longitude: -120.2730)),

    // MARK: Colorado
    SkiResort(name: "Arapahoe Basin",       state: "CO", coordinate: .init(latitude: 39.6425, longitude: -105.8717)),
    SkiResort(name: "Aspen Highlands",      state: "CO", coordinate: .init(latitude: 39.1820, longitude: -106.8560)),
    SkiResort(name: "Aspen Mountain",       state: "CO", coordinate: .init(latitude: 39.1910, longitude: -106.8170)),
    SkiResort(name: "Aspen Snowmass",       state: "CO", coordinate: .init(latitude: 39.2080, longitude: -106.9490)),
    SkiResort(name: "Beaver Creek",         state: "CO", coordinate: .init(latitude: 39.6040, longitude: -106.5160)),
    SkiResort(name: "Breckenridge",         state: "CO", coordinate: .init(latitude: 39.4810, longitude: -106.0380)),
    SkiResort(name: "Buttermilk",           state: "CO", coordinate: .init(latitude: 39.2050, longitude: -106.8610)),
    SkiResort(name: "Copper Mountain",      state: "CO", coordinate: .init(latitude: 39.5020, longitude: -106.1510)),
    SkiResort(name: "Crested Butte",        state: "CO", coordinate: .init(latitude: 38.8690, longitude: -106.9870)),
    SkiResort(name: "Echo Mountain",        state: "CO", coordinate: .init(latitude: 39.6840, longitude: -105.5190)),
    SkiResort(name: "Eldora",               state: "CO", coordinate: .init(latitude: 39.9380, longitude: -105.5840)),
    SkiResort(name: "Granby Ranch",         state: "CO", coordinate: .init(latitude: 40.0440, longitude: -105.9060)),
    SkiResort(name: "Hesperus Ski Area",    state: "CO", coordinate: .init(latitude: 37.2990, longitude: -108.0560)),
    SkiResort(name: "Howelsen Hill",        state: "CO", coordinate: .init(latitude: 40.4910, longitude: -106.8390)),
    SkiResort(name: "Keystone",             state: "CO", coordinate: .init(latitude: 39.5790, longitude: -105.9340)),
    SkiResort(name: "Loveland",             state: "CO", coordinate: .init(latitude: 39.6800, longitude: -105.8970)),
    SkiResort(name: "Monarch Mountain",     state: "CO", coordinate: .init(latitude: 38.5120, longitude: -106.3320)),
    SkiResort(name: "Powderhorn",           state: "CO", coordinate: .init(latitude: 39.0690, longitude: -108.1500)),
    SkiResort(name: "Purgatory",            state: "CO", coordinate: .init(latitude: 37.6300, longitude: -107.8140)),
    SkiResort(name: "Silverton Mountain",   state: "CO", coordinate: .init(latitude: 37.8840, longitude: -107.6650)),
    SkiResort(name: "Snowmass",             state: "CO", coordinate: .init(latitude: 39.2090, longitude: -106.9490)),
    SkiResort(name: "Steamboat",            state: "CO", coordinate: .init(latitude: 40.4550, longitude: -106.8040)),
    SkiResort(name: "Sunlight Mountain",    state: "CO", coordinate: .init(latitude: 39.3990, longitude: -107.3380)),
    SkiResort(name: "Telluride",            state: "CO", coordinate: .init(latitude: 37.9360, longitude: -107.8460)),
    SkiResort(name: "Vail",                 state: "CO", coordinate: .init(latitude: 39.6060, longitude: -106.3550)),
    SkiResort(name: "Winter Park",          state: "CO", coordinate: .init(latitude: 39.8860, longitude: -105.7620)),
    SkiResort(name: "Wolf Creek",           state: "CO", coordinate: .init(latitude: 37.4740, longitude: -106.7930)),
    
    // MARK: Connecticut
    SkiResort(name: "Mount Southington",    state: "CT", coordinate: .init(latitude: 41.5973, longitude: -72.8781)),
    SkiResort(name: "Powder Ridge",         state: "CT", coordinate: .init(latitude: 41.5020, longitude: -72.6804)),
    SkiResort(name: "Ski Sundown",          state: "CT", coordinate: .init(latitude: 41.8090, longitude: -72.9295)),
    SkiResort(name: "Woodbury Ski Area",    state: "CT", coordinate: .init(latitude: 41.5445, longitude: -73.2070)),

    // MARK: Idaho
    SkiResort(name: "Bogus Basin",          state: "ID", coordinate: .init(latitude: 43.7642, longitude: -116.1020)),
    SkiResort(name: "Brundage Mountain",    state: "ID", coordinate: .init(latitude: 45.0050, longitude: -116.1540)),
    SkiResort(name: "Grand Targhee",        state: "ID", coordinate: .init(latitude: 43.7910, longitude: -110.9550)),
    SkiResort(name: "Kelly Canyon",         state: "ID", coordinate: .init(latitude: 43.6070, longitude: -111.6040)),
    // Lookout Pass included in MT
    SkiResort(name: "Pebble Creek",         state: "ID", coordinate: .init(latitude: 42.7890, longitude: -112.0940)),
    SkiResort(name: "Pomerelle",            state: "ID", coordinate: .init(latitude: 42.2440, longitude: -113.8790)),
    SkiResort(name: "Schweitzer",           state: "ID", coordinate: .init(latitude: 48.3680, longitude: -116.6220)),
    SkiResort(name: "Silver Mountain",      state: "ID", coordinate: .init(latitude: 47.5400, longitude: -116.1330)),
    SkiResort(name: "Soldier Mountain",     state: "ID", coordinate: .init(latitude: 43.4810, longitude: -114.8310)),
    SkiResort(name: "Sun Valley (Bald Mountain)", state: "ID", coordinate: .init(latitude: 43.6880, longitude: -114.4090)),
    SkiResort(name: "Sun Valley (Dollar Mountain)", state: "ID", coordinate: .init(latitude: 43.6920, longitude: -114.3490)),
    SkiResort(name: "Tamarack Resort",      state: "ID", coordinate: .init(latitude: 44.6690, longitude: -116.1240)),

    // MARK: Illinois
    SkiResort(name: "Chestnut Mountain",    state: "IL", coordinate: .init(latitude: 42.3140, longitude: -90.3820)),
    SkiResort(name: "Four Lakes",           state: "IL", coordinate: .init(latitude: 41.8230, longitude: -88.0730)),
    SkiResort(name: "Villa Olivia",         state: "IL", coordinate: .init(latitude: 42.0350, longitude: -88.2810)),

    // MARK: Indiana
    SkiResort(name: "Paoli Peaks",          state: "IN", coordinate: .init(latitude: 38.5560, longitude: -86.4690)),
    SkiResort(name: "Perfect North Slopes", state: "IN", coordinate: .init(latitude: 39.1450, longitude: -84.8560)),

    // MARK: Iowa
    SkiResort(name: "Seven Oaks",           state: "IA", coordinate: .init(latitude: 42.1060, longitude: -93.9300)),
    SkiResort(name: "Sundown Mountain",     state: "IA", coordinate: .init(latitude: 42.5580, longitude: -90.7430)),
    SkiResort(name: "Sleepy Hollow Sports Park", state: "IA", coordinate: .init(latitude: 41.7570, longitude: -91.6400)),

    // MARK: Kentucky
    SkiResort(name: "Perfect North Slopes", state: "KY", coordinate: .init(latitude: 39.1450, longitude: -84.8560)),

    // MARK: Maine
    SkiResort(name: "Big Rock",             state: "ME", coordinate: .init(latitude: 46.9100, longitude: -67.8680)),
    SkiResort(name: "Black Mountain of Maine", state: "ME", coordinate: .init(latitude: 44.5360, longitude: -70.5450)),
    SkiResort(name: "Camden Snow Bowl",     state: "ME", coordinate: .init(latitude: 44.2430, longitude: -69.0490)),
    SkiResort(name: "Lost Valley",          state: "ME", coordinate: .init(latitude: 44.0850, longitude: -70.2580)),
    SkiResort(name: "Mount Abram",          state: "ME", coordinate: .init(latitude: 44.3790, longitude: -70.6740)),
    SkiResort(name: "Pleasant Mountain",    state: "ME", coordinate: .init(latitude: 44.0980, longitude: -70.7910)),
    SkiResort(name: "Saddleback",           state: "ME", coordinate: .init(latitude: 44.9360, longitude: -70.5070)),
    SkiResort(name: "Shawnee Peak",         state: "ME", coordinate: .init(latitude: 44.0980, longitude: -70.7910)),
    SkiResort(name: "Sugarloaf",            state: "ME", coordinate: .init(latitude: 45.0310, longitude: -70.3130)),
    SkiResort(name: "Sunday River",         state: "ME", coordinate: .init(latitude: 44.4740, longitude: -70.8560)),
    SkiResort(name: "Titcomb Mountain",     state: "ME", coordinate: .init(latitude: 44.6700, longitude: -70.1510)),
    
    // MARK: Maryland
    SkiResort(name: "Wisp Resort",          state: "MD", coordinate: .init(latitude: 39.5570, longitude: -79.3620)),

    // MARK: Massachusetts
    SkiResort(name: "Berkshire East",       state: "MA", coordinate: .init(latitude: 42.6200, longitude: -72.7850)),
    SkiResort(name: "Blue Hills",           state: "MA", coordinate: .init(latitude: 42.2100, longitude: -71.1080)),
    SkiResort(name: "Bousquet Mountain",    state: "MA", coordinate: .init(latitude: 42.4500, longitude: -73.2890)),
    SkiResort(name: "Bradford Ski Area",    state: "MA", coordinate: .init(latitude: 42.7560, longitude: -71.0990)),
    SkiResort(name: "Butternut",            state: "MA", coordinate: .init(latitude: 42.0580, longitude: -73.3200)),
    SkiResort(name: "Catamount",            state: "MA", coordinate: .init(latitude: 42.1220, longitude: -73.4830)),
    SkiResort(name: "Jiminy Peak",          state: "MA", coordinate: .init(latitude: 42.5550, longitude: -73.2920)),
    SkiResort(name: "Nashoba Valley",       state: "MA", coordinate: .init(latitude: 42.5150, longitude: -71.4330)),
    SkiResort(name: "Otis Ridge",           state: "MA", coordinate: .init(latitude: 42.1850, longitude: -73.0970)),
    SkiResort(name: "Ski Ward",             state: "MA", coordinate: .init(latitude: 42.3050, longitude: -71.5180)),
    SkiResort(name: "Wachusett Mountain",   state: "MA", coordinate: .init(latitude: 42.4880, longitude: -71.8860)),

    // MARK: Michigan
    SkiResort(name: "Alpine Valley",        state: "MI", coordinate: .init(latitude: 42.7070, longitude: -83.5890)),
    SkiResort(name: "Apple Mountain",       state: "MI", coordinate: .init(latitude: 43.4830, longitude: -84.1460)),
    SkiResort(name: "Big Powderhorn",       state: "MI", coordinate: .init(latitude: 46.2530, longitude: -90.0760)),
    SkiResort(name: "Boyne Highlands",      state: "MI", coordinate: .init(latitude: 45.4690, longitude: -84.9240)),
    SkiResort(name: "Boyne Mountain",       state: "MI", coordinate: .init(latitude: 45.1640, longitude: -84.9250)),
    SkiResort(name: "Cabin Creek",          state: "MI", coordinate: .init(latitude: 42.6650, longitude: -85.7930)),
    SkiResort(name: "Cannonsburg",          state: "MI", coordinate: .init(latitude: 43.0560, longitude: -85.4680)),
    SkiResort(name: "Crystal Mountain",     state: "MI", coordinate: .init(latitude: 44.5190, longitude: -85.9850)),
    SkiResort(name: "Hanson Hills",         state: "MI", coordinate: .init(latitude: 44.6800, longitude: -84.6880)),
    SkiResort(name: "Indianhead Mountain",  state: "MI", coordinate: .init(latitude: 46.2540, longitude: -90.0490)),
    SkiResort(name: "Marquette Mountain",   state: "MI", coordinate: .init(latitude: 46.5010, longitude: -87.4670)),
    SkiResort(name: "Mont Ripley",          state: "MI", coordinate: .init(latitude: 47.1150, longitude: -88.5500)),
    SkiResort(name: "Mount Bohemia",        state: "MI", coordinate: .init(latitude: 47.3850, longitude: -88.0580)),
    SkiResort(name: "Mt. Brighton",         state: "MI", coordinate: .init(latitude: 42.5290, longitude: -83.7830)),
    SkiResort(name: "Mt. Holiday",          state: "MI", coordinate: .init(latitude: 44.7420, longitude: -85.5490)),
    SkiResort(name: "Mt. Holly",            state: "MI", coordinate: .init(latitude: 42.7970, longitude: -83.6270)),
    SkiResort(name: "Nubs Nob",             state: "MI", coordinate: .init(latitude: 45.4690, longitude: -84.9350)),
    SkiResort(name: "Pine Knob",            state: "MI", coordinate: .init(latitude: 42.7450, longitude: -83.3730)),
    SkiResort(name: "Porcupine Mountains",  state: "MI", coordinate: .init(latitude: 46.8160, longitude: -89.7790)),
    SkiResort(name: "Shanty Creek",         state: "MI", coordinate: .init(latitude: 44.9760, longitude: -85.1420)),
    SkiResort(name: "Ski Brule",            state: "MI", coordinate: .init(latitude: 46.0690, longitude: -88.6330)),
    SkiResort(name: "Snow Snake",           state: "MI", coordinate: .init(latitude: 43.4250, longitude: -84.6980)),
    SkiResort(name: "Timber Ridge",         state: "MI", coordinate: .init(latitude: 42.3480, longitude: -85.6460)),
    SkiResort(name: "Treetops Resort",      state: "MI", coordinate: .init(latitude: 45.0290, longitude: -84.6280)),

    // MARK: Minnesota
    SkiResort(name: "Afton Alps",           state: "MN", coordinate: .init(latitude: 44.8580, longitude: -92.7900)),
    SkiResort(name: "Andes Tower Hills",    state: "MN", coordinate: .init(latitude: 45.8250, longitude: -95.3940)),
    SkiResort(name: "Buck Hill",            state: "MN", coordinate: .init(latitude: 44.7720, longitude: -93.2770)),
    SkiResort(name: "Buena Vista",          state: "MN", coordinate: .init(latitude: 45.5640, longitude: -94.2550)),
    SkiResort(name: "Coffee Mill",          state: "MN", coordinate: .init(latitude: 44.3000, longitude: -92.2640)),
    SkiResort(name: "Detroit Mountain",     state: "MN", coordinate: .init(latitude: 46.8130, longitude: -95.8790)),
    SkiResort(name: "Giants Ridge",         state: "MN", coordinate: .init(latitude: 47.5530, longitude: -92.4120)),
    SkiResort(name: "Great Bear",           state: "MN", coordinate: .init(latitude: 44.0060, longitude: -92.4670)),
    SkiResort(name: "Highlands of Olympia", state: "MN", coordinate: .init(latitude: 44.7460, longitude: -93.4350)),
    SkiResort(name: "Hyland Hills",         state: "MN", coordinate: .init(latitude: 44.8390, longitude: -93.3650)),
    SkiResort(name: "Lutsen Mountains",     state: "MN", coordinate: .init(latitude: 47.6630, longitude: -90.7130)),
    SkiResort(name: "Magic Mountain",       state: "MN", coordinate: .init(latitude: 47.4970, longitude: -92.8830)),
    SkiResort(name: "Mount Kato",           state: "MN", coordinate: .init(latitude: 44.1460, longitude: -94.0570)),
    SkiResort(name: "Powder Ridge",         state: "MN", coordinate: .init(latitude: 45.3270, longitude: -94.1600)),
    SkiResort(name: "Spirit Mountain",      state: "MN", coordinate: .init(latitude: 46.7180, longitude: -92.2170)),
    SkiResort(name: "Trollhaugen",          state: "MN", coordinate: .init(latitude: 45.3940, longitude: -92.6230)),
    SkiResort(name: "Welch Village",        state: "MN", coordinate: .init(latitude: 44.5430, longitude: -92.7300)),
    SkiResort(name: "Wild Mountain",        state: "MN", coordinate: .init(latitude: 45.4240, longitude: -92.6610)),
    
    // MARK: Missouri
    SkiResort(name: "Hidden Valley",        state: "MO", coordinate: .init(latitude: 38.5300, longitude: -90.6420)),
    SkiResort(name: "Snow Creek",           state: "MO", coordinate: .init(latitude: 39.3930, longitude: -94.7890)),

    // MARK: Montana
    SkiResort(name: "Bear Paw Ski Bowl",    state: "MT", coordinate: .init(latitude: 48.1800, longitude: -109.5900)),
    SkiResort(name: "Big Sky",              state: "MT", coordinate: .init(latitude: 45.2840, longitude: -111.4010)),
    SkiResort(name: "Blacktail Mountain",   state: "MT", coordinate: .init(latitude: 47.9250, longitude: -114.3590)),
    SkiResort(name: "Bridger Bowl",         state: "MT", coordinate: .init(latitude: 45.8170, longitude: -110.8960)),
    SkiResort(name: "Discovery",            state: "MT", coordinate: .init(latitude: 46.2460, longitude: -113.2380)),
    SkiResort(name: "Great Divide",         state: "MT", coordinate: .init(latitude: 46.6140, longitude: -112.3330)),
    SkiResort(name: "Lost Trail Powder Mountain", state: "MT", coordinate: .init(latitude: 45.6930, longitude: -113.9510)),
    SkiResort(name: "Lookout Pass",         state: "MT", coordinate: .init(latitude: 47.4550, longitude: -115.6990)),
    SkiResort(name: "Maverick Mountain",    state: "MT", coordinate: .init(latitude: 45.3880, longitude: -113.9320)),
    SkiResort(name: "Montana Snowbowl",     state: "MT", coordinate: .init(latitude: 46.8720, longitude: -113.9980)),
    SkiResort(name: "Red Lodge Mountain",   state: "MT", coordinate: .init(latitude: 45.1850, longitude: -109.3360)),
    SkiResort(name: "Showdown Montana",     state: "MT", coordinate: .init(latitude: 46.8380, longitude: -110.6990)),
    SkiResort(name: "Whitefish Mountain Resort", state: "MT", coordinate: .init(latitude: 48.4800, longitude: -114.3580)),

    // MARK: Nevada
    SkiResort(name: "Diamond Peak",         state: "NV", coordinate: .init(latitude: 39.2540, longitude: -119.9230)),
    SkiResort(name: "Lee Canyon",           state: "NV", coordinate: .init(latitude: 36.3030, longitude: -115.6750)),
    SkiResort(name: "Mt. Rose",             state: "NV", coordinate: .init(latitude: 39.3290, longitude: -119.8850)),

    // MARK: New Hampshire
    SkiResort(name: "Attitash",             state: "NH", coordinate: .init(latitude: 44.0820, longitude: -71.2290)),
    SkiResort(name: "Black Mountain",       state: "NH", coordinate: .init(latitude: 44.1800, longitude: -71.3040)),
    SkiResort(name: "Bretton Woods",        state: "NH", coordinate: .init(latitude: 44.2590, longitude: -71.4380)),
    SkiResort(name: "Cannon Mountain",      state: "NH", coordinate: .init(latitude: 44.1560, longitude: -71.6980)),
    SkiResort(name: "Cranmore",             state: "NH", coordinate: .init(latitude: 44.0610, longitude: -71.1100)),
    SkiResort(name: "Gunstock",             state: "NH", coordinate: .init(latitude: 43.5380, longitude: -71.3650)),
    SkiResort(name: "King Pine",            state: "NH", coordinate: .init(latitude: 44.1560, longitude: -71.1990)),
    SkiResort(name: "Loon Mountain",        state: "NH", coordinate: .init(latitude: 44.0360, longitude: -71.6210)),
    SkiResort(name: "McIntyre Ski Area",    state: "NH", coordinate: .init(latitude: 43.0090, longitude: -71.4920)),
    SkiResort(name: "Mount Sunapee",        state: "NH", coordinate: .init(latitude: 43.3370, longitude: -72.0800)),
    SkiResort(name: "Pats Peak",            state: "NH", coordinate: .init(latitude: 43.2000, longitude: -71.8430)),
    SkiResort(name: "Ragged Mountain",      state: "NH", coordinate: .init(latitude: 43.4860, longitude: -71.8430)),
    SkiResort(name: "Waterville Valley",    state: "NH", coordinate: .init(latitude: 43.9600, longitude: -71.5030)),
    SkiResort(name: "Wildcat Mountain",     state: "NH", coordinate: .init(latitude: 44.2640, longitude: -71.2010)),
    
    // MARK: New Jersey
    SkiResort(name: "Campgaw Mountain",     state: "NJ", coordinate: .init(latitude: 41.0580, longitude: -74.1760)),
    SkiResort(name: "Hidden Valley",        state: "NJ", coordinate: .init(latitude: 41.1900, longitude: -74.4820)),
    SkiResort(name: "Mountain Creek",       state: "NJ", coordinate: .init(latitude: 41.2000, longitude: -74.5050)),

    // MARK: New Mexico
    SkiResort(name: "Angel Fire",           state: "NM", coordinate: .init(latitude: 36.3930, longitude: -105.2850)),
    SkiResort(name: "Pajarito Mountain",    state: "NM", coordinate: .init(latitude: 35.8850, longitude: -106.3930)),
    SkiResort(name: "Red River",            state: "NM", coordinate: .init(latitude: 36.7080, longitude: -105.4060)),
    SkiResort(name: "Sandia Peak",          state: "NM", coordinate: .init(latitude: 35.2100, longitude: -106.4490)),
    SkiResort(name: "Sipapu",               state: "NM", coordinate: .init(latitude: 36.1540, longitude: -105.5480)),
    SkiResort(name: "Ski Apache",           state: "NM", coordinate: .init(latitude: 33.3970, longitude: -105.7940)),
    SkiResort(name: "Taos Ski Valley",      state: "NM", coordinate: .init(latitude: 36.5940, longitude: -105.4540)),

    // MARK: New York
    SkiResort(name: "Belleayre",            state: "NY", coordinate: .init(latitude: 42.1390, longitude: -74.5040)),
    SkiResort(name: "Bristol Mountain",     state: "NY", coordinate: .init(latitude: 42.7410, longitude: -77.4020)),
    SkiResort(name: "Buffalo Ski Center",   state: "NY", coordinate: .init(latitude: 42.7420, longitude: -78.7590)),
    SkiResort(name: "Catamount",            state: "NY", coordinate: .init(latitude: 42.1220, longitude: -73.4830)),
    SkiResort(name: "Dry Hill",             state: "NY", coordinate: .init(latitude: 43.9890, longitude: -75.9320)),
    SkiResort(name: "Gore Mountain",        state: "NY", coordinate: .init(latitude: 43.6730, longitude: -74.0050)),
    SkiResort(name: "Greek Peak",           state: "NY", coordinate: .init(latitude: 42.5080, longitude: -76.1460)),
    SkiResort(name: "Holiday Mountain",     state: "NY", coordinate: .init(latitude: 41.6730, longitude: -74.7030)),
    SkiResort(name: "Holimont",             state: "NY", coordinate: .init(latitude: 42.2540, longitude: -78.6770)),
    SkiResort(name: "Hunter Mountain",      state: "NY", coordinate: .init(latitude: 42.2050, longitude: -74.2100)),
    SkiResort(name: "Kissing Bridge",       state: "NY", coordinate: .init(latitude: 42.6490, longitude: -78.6750)),
    SkiResort(name: "Labrador Mountain",    state: "NY", coordinate: .init(latitude: 42.7410, longitude: -76.0320)),
    SkiResort(name: "Mount Peter",          state: "NY", coordinate: .init(latitude: 41.2240, longitude: -74.3600)),
    SkiResort(name: "Oak Mountain",         state: "NY", coordinate: .init(latitude: 43.0910, longitude: -74.2550)),
    SkiResort(name: "Peek'n Peak",          state: "NY", coordinate: .init(latitude: 42.0620, longitude: -79.7340)),
    SkiResort(name: "Plattekill",           state: "NY", coordinate: .init(latitude: 42.2930, longitude: -74.6530)),
    SkiResort(name: "Royal Mountain",       state: "NY", coordinate: .init(latitude: 43.0690, longitude: -74.3760)),
    SkiResort(name: "Snow Ridge",           state: "NY", coordinate: .init(latitude: 43.6810, longitude: -75.6850)),
    SkiResort(name: "Song Mountain",        state: "NY", coordinate: .init(latitude: 42.7430, longitude: -76.0300)),
    SkiResort(name: "Swain",                state: "NY", coordinate: .init(latitude: 42.4770, longitude: -77.8570)),
    SkiResort(name: "Thunder Ridge",        state: "NY", coordinate: .init(latitude: 41.3630, longitude: -73.5850)),
    SkiResort(name: "Titus Mountain",       state: "NY", coordinate: .init(latitude: 44.6710, longitude: -74.1870)),
    SkiResort(name: "West Mountain",        state: "NY", coordinate: .init(latitude: 43.3500, longitude: -73.6780)),
    SkiResort(name: "Whiteface",            state: "NY", coordinate: .init(latitude: 44.3650, longitude: -73.9030)),
    SkiResort(name: "Willard Mountain",     state: "NY", coordinate: .init(latitude: 43.1140, longitude: -73.5050)),
    SkiResort(name: "Windham Mountain",     state: "NY", coordinate: .init(latitude: 42.2930, longitude: -74.2570)),

    // MARK: North Carolina
    SkiResort(name: "Appalachian Ski Mountain", state: "NC", coordinate: .init(latitude: 36.1740, longitude: -81.6600)),
    SkiResort(name: "Beech Mountain",       state: "NC", coordinate: .init(latitude: 36.2000, longitude: -81.8710)),
    SkiResort(name: "Cataloochee",          state: "NC", coordinate: .init(latitude: 35.6450, longitude: -83.0890)),
    SkiResort(name: "Hatley Pointe",        state: "NC", coordinate: .init(latitude: 35.8760, longitude: -82.9540)),
    SkiResort(name: "Sugar Mountain",       state: "NC", coordinate: .init(latitude: 36.1300, longitude: -81.8700)),

    // MARK: Ohio
    SkiResort(name: "Alpine Valley",        state: "OH", coordinate: .init(latitude: 41.6060, longitude: -81.1350)),
    SkiResort(name: "Boston Mills",         state: "OH", coordinate: .init(latitude: 41.2640, longitude: -81.5640)),
    SkiResort(name: "Brandywine",           state: "OH", coordinate: .init(latitude: 41.2770, longitude: -81.5670)),
    SkiResort(name: "Mad River Mountain",   state: "OH", coordinate: .init(latitude: 40.3140, longitude: -83.6780)),
    SkiResort(name: "Snow Trails",          state: "OH", coordinate: .init(latitude: 40.7050, longitude: -82.5170)),

    // MARK: Pennsylvania
    SkiResort(name: "Bear Creek",           state: "PA", coordinate: .init(latitude: 40.4800, longitude: -75.5500)),
    SkiResort(name: "Blue Knob",            state: "PA", coordinate: .init(latitude: 40.3150, longitude: -78.5600)),
    SkiResort(name: "Blue Mountain",        state: "PA", coordinate: .init(latitude: 40.8100, longitude: -75.5200)),
    SkiResort(name: "Camelback",            state: "PA", coordinate: .init(latitude: 41.0500, longitude: -75.3500)),
    SkiResort(name: "Elk Mountain",         state: "PA", coordinate: .init(latitude: 41.7050, longitude: -75.6050)),
    SkiResort(name: "Hidden Valley",        state: "PA", coordinate: .init(latitude: 40.0600, longitude: -79.2600)),
    SkiResort(name: "Jack Frost",           state: "PA", coordinate: .init(latitude: 41.1100, longitude: -75.6400)),
    SkiResort(name: "Laurel Mountain",      state: "PA", coordinate: .init(latitude: 40.3350, longitude: -79.1860)),
    SkiResort(name: "Liberty Mountain",     state: "PA", coordinate: .init(latitude: 39.7630, longitude: -77.3750)),
    SkiResort(name: "Montage Mountain",     state: "PA", coordinate: .init(latitude: 41.3350, longitude: -75.6620)),
    SkiResort(name: "Roundtop Mountain",    state: "PA", coordinate: .init(latitude: 40.0930, longitude: -76.9290)),
    SkiResort(name: "Seven Springs",        state: "PA", coordinate: .init(latitude: 40.0230, longitude: -79.2970)),
    SkiResort(name: "Shawnee Mountain",     state: "PA", coordinate: .init(latitude: 41.0520, longitude: -75.1100)),
    SkiResort(name: "Ski Big Bear",         state: "PA", coordinate: .init(latitude: 41.1910, longitude: -75.2270)),
    SkiResort(name: "Tussey Mountain",      state: "PA", coordinate: .init(latitude: 40.7250, longitude: -77.7950)),
    SkiResort(name: "Whitetail",            state: "PA", coordinate: .init(latitude: 39.7400, longitude: -77.9350)),

    // MARK: Rhode Island
    SkiResort(name: "Yawgoo Valley",        state: "RI", coordinate: .init(latitude: 41.5080, longitude: -71.5220)),

    // MARK: South Dakota
    SkiResort(name: "Deer Mountain",        state: "SD", coordinate: .init(latitude: 44.3200, longitude: -103.7500)),
    SkiResort(name: "Terry Peak",           state: "SD", coordinate: .init(latitude: 44.3460, longitude: -103.7610)),
    
    // MARK: Tennessee
    SkiResort(name: "Ober Mountain",        state: "TN", coordinate: .init(latitude: 35.7130, longitude: -83.5110)),

    // MARK: Utah
    SkiResort(name: "Alta",                 state: "UT", coordinate: .init(latitude: 40.5880, longitude: -111.6380)),
    SkiResort(name: "Beaver Mountain",      state: "UT", coordinate: .init(latitude: 41.9680, longitude: -111.5410)),
    SkiResort(name: "Brian Head",           state: "UT", coordinate: .init(latitude: 37.6920, longitude: -112.8490)),
    SkiResort(name: "Brighton",             state: "UT", coordinate: .init(latitude: 40.5980, longitude: -111.5830)),
    SkiResort(name: "Cherry Peak",          state: "UT", coordinate: .init(latitude: 41.8940, longitude: -111.7360)),
    SkiResort(name: "Deer Valley",          state: "UT", coordinate: .init(latitude: 40.6190, longitude: -111.4780)),
    SkiResort(name: "Eagle Point",          state: "UT", coordinate: .init(latitude: 38.3230, longitude: -112.3830)),
    SkiResort(name: "Nordic Valley",        state: "UT", coordinate: .init(latitude: 41.3080, longitude: -111.8540)),
    SkiResort(name: "Park City Mountain",   state: "UT", coordinate: .init(latitude: 40.6510, longitude: -111.5070)),
    SkiResort(name: "Powder Mountain",      state: "UT", coordinate: .init(latitude: 41.3790, longitude: -111.7810)),
    SkiResort(name: "Snowbasin",            state: "UT", coordinate: .init(latitude: 41.2160, longitude: -111.8560)),
    SkiResort(name: "Snowbird",             state: "UT", coordinate: .init(latitude: 40.5800, longitude: -111.6570)),
    SkiResort(name: "Solitude",             state: "UT", coordinate: .init(latitude: 40.6190, longitude: -111.5930)),
    SkiResort(name: "Sundance",             state: "UT", coordinate: .init(latitude: 40.3920, longitude: -111.5790)),
    SkiResort(name: "Woodward Park City",   state: "UT", coordinate: .init(latitude: 40.7560, longitude: -111.6000)),

    // MARK: Vermont
    SkiResort(name: "Bolton Valley",        state: "VT", coordinate: .init(latitude: 44.4210, longitude: -72.8500)),
    SkiResort(name: "Bromley",              state: "VT", coordinate: .init(latitude: 43.2320, longitude: -72.9360)),
    SkiResort(name: "Burke Mountain",       state: "VT", coordinate: .init(latitude: 44.5700, longitude: -71.8920)),
    SkiResort(name: "Cochran's Ski Area",   state: "VT", coordinate: .init(latitude: 44.4210, longitude: -72.7910)),
    SkiResort(name: "Jay Peak",             state: "VT", coordinate: .init(latitude: 44.9370, longitude: -72.5260)),
    SkiResort(name: "Killington",           state: "VT", coordinate: .init(latitude: 43.6260, longitude: -72.7960)),
    SkiResort(name: "Mad River Glen",       state: "VT", coordinate: .init(latitude: 44.2030, longitude: -72.9170)),
    SkiResort(name: "Magic Mountain",       state: "VT", coordinate: .init(latitude: 43.2010, longitude: -72.7800)),
    SkiResort(name: "Mount Snow",           state: "VT", coordinate: .init(latitude: 42.9600, longitude: -72.9000)),
    SkiResort(name: "Okemo",                state: "VT", coordinate: .init(latitude: 43.4020, longitude: -72.7170)),
    SkiResort(name: "Pico Mountain",        state: "VT", coordinate: .init(latitude: 43.6720, longitude: -72.8430)),
    SkiResort(name: "Smugglers' Notch",     state: "VT", coordinate: .init(latitude: 44.5850, longitude: -72.7900)),
    SkiResort(name: "Stowe",                state: "VT", coordinate: .init(latitude: 44.5290, longitude: -72.7810)),
    SkiResort(name: "Stratton",             state: "VT", coordinate: .init(latitude: 43.1130, longitude: -72.9070)),
    SkiResort(name: "Suicide Six",          state: "VT", coordinate: .init(latitude: 43.6460, longitude: -72.5380)),

    // MARK: Virginia
    SkiResort(name: "Bryce Resort",         state: "VA", coordinate: .init(latitude: 38.8150, longitude: -78.7670)),
    SkiResort(name: "Massanutten",          state: "VA", coordinate: .init(latitude: 38.4090, longitude: -78.7590)),
    SkiResort(name: "The Homestead",        state: "VA", coordinate: .init(latitude: 37.9970, longitude: -79.8310)),
    SkiResort(name: "Wintergreen",          state: "VA", coordinate: .init(latitude: 37.9140, longitude: -78.9430)),

    // MARK: Washington
    SkiResort(name: "49 Degrees North",     state: "WA", coordinate: .init(latitude: 48.4148, longitude: -117.7283)),
    SkiResort(name: "Badger Mountain Ski Hill", state: "WA", coordinate: .init(latitude: 46.2593, longitude: -119.2743)),
    SkiResort(name: "Bluewood",             state: "WA", coordinate: .init(latitude: 46.0850, longitude: -117.8231)),
    SkiResort(name: "Crystal Mountain",     state: "WA", coordinate: .init(latitude: 46.9282, longitude: -121.5073)),
    SkiResort(name: "Hurricane Ridge",      state: "WA", coordinate: .init(latitude: 47.9695, longitude: -123.4981)),
    SkiResort(name: "Leavenworth Ski Hill", state: "WA", coordinate: .init(latitude: 47.6046, longitude: -120.6615)),
    SkiResort(name: "Loup Loup Ski Bowl",   state: "WA", coordinate: .init(latitude: 48.3939, longitude: -119.8997)),
    SkiResort(name: "Mission Ridge",        state: "WA", coordinate: .init(latitude: 47.2928, longitude: -120.3997)),
    SkiResort(name: "Mt. Baker",            state: "WA", coordinate: .init(latitude: 48.8599, longitude: -121.6731)),
    SkiResort(name: "Mt. Spokane",          state: "WA", coordinate: .init(latitude: 47.9216, longitude: -117.1080)),
    SkiResort(name: "Snoqualmie Pass",      state: "WA", coordinate: .init(latitude: 47.4242, longitude: -121.4130)),
    SkiResort(name: "Stevens Pass",         state: "WA", coordinate: .init(latitude: 47.7448, longitude: -121.0900)),
    SkiResort(name: "White Pass",           state: "WA", coordinate: .init(latitude: 46.6380, longitude: -121.3924)),

    // MARK: West Virginia
    SkiResort(name: "Canaan Valley",        state: "WV", coordinate: .init(latitude: 39.0240, longitude: -79.4560)),
    SkiResort(name: "Oglebay Resort",       state: "WV", coordinate: .init(latitude: 40.0940, longitude: -80.6500)),
    SkiResort(name: "Snowshoe",             state: "WV", coordinate: .init(latitude: 38.4110, longitude: -79.9930)),
    SkiResort(name: "Timberline Mountain",  state: "WV", coordinate: .init(latitude: 39.0240, longitude: -79.4160)),
    SkiResort(name: "Winterplace",          state: "WV", coordinate: .init(latitude: 37.5950, longitude: -81.1180)),

    // MARK: Wisconsin
    SkiResort(name: "Alpine Valley",        state: "WI", coordinate: .init(latitude: 42.7350, longitude: -88.4040)),
    SkiResort(name: "Blackjack Mountain",   state: "WI", coordinate: .init(latitude: 46.2540, longitude: -90.0490)),
    SkiResort(name: "Cascade Mountain",     state: "WI", coordinate: .init(latitude: 43.5350, longitude: -89.5280)),
    SkiResort(name: "Devil's Head",         state: "WI", coordinate: .init(latitude: 43.4200, longitude: -89.6270)),
    SkiResort(name: "Granite Peak",         state: "WI", coordinate: .init(latitude: 44.9310, longitude: -89.6830)),
    SkiResort(name: "Nordic Mountain",      state: "WI", coordinate: .init(latitude: 44.0620, longitude: -89.2350)),
    SkiResort(name: "Sunburst",             state: "WI", coordinate: .init(latitude: 43.5150, longitude: -88.2000)),
    SkiResort(name: "Trollhaugen",          state: "WI", coordinate: .init(latitude: 45.3940, longitude: -92.6230)),
    SkiResort(name: "Whitecap Mountains",   state: "WI", coordinate: .init(latitude: 46.4480, longitude: -90.2440)),
    SkiResort(name: "Wilmot Mountain",      state: "WI", coordinate: .init(latitude: 42.5020, longitude: -88.1860)),

    // MARK: Wyoming
    SkiResort(name: "Grand Targhee",        state: "WY", coordinate: .init(latitude: 43.7910, longitude: -110.9550)),
    SkiResort(name: "Hogadon Basin",        state: "WY", coordinate: .init(latitude: 42.7770, longitude: -106.3440)),
    SkiResort(name: "Jackson Hole",         state: "WY", coordinate: .init(latitude: 43.5870, longitude: -110.8270)),
    SkiResort(name: "Meadowlark",           state: "WY", coordinate: .init(latitude: 44.1660, longitude: -107.1960)),
    SkiResort(name: "Snow King",            state: "WY", coordinate: .init(latitude: 43.4790, longitude: -110.7620)),
    SkiResort(name: "White Pine",           state: "WY", coordinate: .init(latitude: 42.7890, longitude: -109.5860)),
]

// Fuzzy-search ski resorts by name. Returns best matches up to `limit`.
func searchSkiResorts(_ query: String, limit: Int = 5) -> [SkiResort] {
    guard !query.isEmpty else { return [] }
    let q = query.lowercased()
    return skiResorts
        .filter { $0.name.lowercased().contains(q) || $0.state.lowercased() == q }
        .prefix(limit)
        .map { $0 }
}
