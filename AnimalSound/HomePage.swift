//
//  HomePage.swift
//  AnimalSound
//
//  Created by yasarkilic on 14.09.2023.
//
import SwiftUI

struct HomePage: View {
    @EnvironmentObject var audioManager: AudioManager
    @State private var searchText = ""
    
    var filteredAnimals: [String] {
        if searchText.isEmpty {
            return Array(animals.keys)
        } else {
            return Array(animals.keys)
                .filter { $0.lowercased().hasPrefix(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        TextField("🔍Search Animal", text: $searchText)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .autocapitalization(.none)
                    }
                    .padding(.horizontal, 10)
                    
                    VStack(spacing: 12) {
                        ForEach(Array(filteredAnimals.enumerated()), id: \.offset) { index, animal in
                            AnimalButton(animalName: animal,
                                         animalSound: animals[animal]?.0 ?? "",
                                         animalGroup: animals[animal]?.1 ?? "",
                                         animalDescription: animals[animal]?.2 ?? "",
                                         buttonColor: colors[index % colors.count])
                                .padding(.horizontal, 10)
                        }
                    }
                }
            }
            .background(Color.mint.opacity(0.08))
            .navigationTitle("Animals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button("Rate") {
                            
                        }.foregroundColor(Color.red)
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "square.and.arrow.up")
                        }.foregroundColor(Color.red)
                    }
                }
            }
        }
    }
    
    let animals = [
        "dog": ("Woof", "Mammal", "Known as man's best friend, dogs are loyal and often used for companionship, hunting, and work."),
        "cat": ("Meow", "Mammal", "Independent creatures that are curious and agile. Known for their playful nature."),
        "cow": ("Moo", "Mammal", "Domesticated farm animals that provide milk, meat, and hides. Known for their docile nature."),
        "horse": ("Neigh", "Mammal", "Used for riding, racing, and work. Known for their speed and strength."),
        "sheep": ("Baa", "Mammal", "Farm animals primarily raised for wool, meat, and milk. Known for their herding instinct."),
        "rooster": ("Cock-a-doodle-doo", "Bird", "Male chickens often found on farms. Known for their early morning crowing."),
        "duck": ("Quack", "Bird", "Waterfowl that are comfortable on land and water. Known for their quacking sound."),
        "frog": ("Ribbit", "Amphibian", "Can live both in water and on land. Known for their jumping abilities and vocalizations."),
        "pig": ("Oink", "Mammal", "Farm animals that are often raised for meat. Known for their keen sense of smell."),
        "elephant": ("Trumpet", "Mammal", "The largest land animal, known for their intelligence and long trunks."),
        "wolf": ("Howl", "Mammal", "Wild canines that live in packs. Known for their howling and hunting skills."),
        "owl": ("Hoot", "Bird", "Nocturnal birds of prey. Known for their keen eyesight and ability to rotate their heads."),
        "goat": ("Bleat", "Mammal", "Adaptable animals that live on farms and mountains. Known for their climbing ability."),
        "crow": ("Caw", "Bird", "Highly intelligent birds that are adaptable to various environments."),
        "lion": ("Roar", "Mammal", "Known as the king of the jungle, lions are large cats that live in prides."),
        "cicada": ("Chirp", "Insect", "Known for their loud chirps, they are most famous for their 17-year life cycle."),
        "dolphin": ("Click", "Mammal", "Highly intelligent sea creatures known for their playful behavior and echolocation skills."),
        "donkey": ("Hee-haw", "Mammal", "Strong and sturdy animals used for work and transportation."),
        "parrot": ("Squawk", "Bird", "Colorful birds that can mimic sounds and are popular as pets."),
        "bear": ("Growl", "Mammal", "Large omnivores that live in forests and have a varied diet."),
        "seagull": ("Squawk", "Bird", "Commonly found near the sea, known for their scavenging habits."),
        "monkey": ("Chatter", "Mammal", "Agile and social animals known for their intelligence and climbing skills."),
        "tiger": ("Roar", "Mammal", "Large feline predators known for their distinctive orange fur and black stripes."),
        "chimpanzee": ("Hoot", "Mammal", "Closest to humans genetically, known for their intelligence and social structure."),
        "bee": ("Buzz", "Insect", "Known for making honey and living in colonies. Play a crucial role in pollination."),
        "whale": ("Sing", "Mammal", "The largest animal alive, known for their complex songs and social groups."),
        "coyote": ("Yelp", "Mammal", "Related to dogs and wolves, known for their adaptability."),
        "cricket": ("Chirp", "Insect", "Common in grassy areas and known for their chirping sounds."),
        "peacock": ("Scream", "Bird", "Known for its colorful feathers and elaborate courtship display."),
        "snake": ("Hiss", "Reptile", "Legless reptiles known for their slithering movement and some for their venom."),
        "rhinoceros": ("Snort", "Mammal", "Large mammals known for their thick skin and one or two horns."),
        "eagle": ("Chirp", "Bird", "Birds of prey known for their keen eyesight and powerful talons."),
        
    ]


    
    let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .pink, .orange, .gray]
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .environmentObject(AudioManager())
    }
}



