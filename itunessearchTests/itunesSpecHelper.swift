 // Helper files for specs
 
 class StringHelper {
    var sentence: String
    
    init(initString: String) {
        self.sentence = initString
    }
    
    func indexChar(characterToFind:Character) -> Int {
        for (index, character) in enumerate(sentence) {
            if character==characterToFind { return index }
        }
        return -1
    }
 }