//Testing the Quick BDD framework

import Quick
import Nimble
import itunessearch

class searchTest: QuickSpec {
    
    override func spec() {
        
        describe("the spec helper") {
            var myString: StringHelper = StringHelper()
            beforeEach {
                myString = StringHelper(initString: "this is a weird string")
            }
            
            it("should be able to index character within a string") {
                expect(myString.indexChar("w")).to.equal(10)
            }
            
            it("should return -1 when it can't find a character") {
                expect(myString.indexChar("z")).to.equal(-1)
            }
            
        }
        
        describe("a search function") {
            var myVC: ViewController = ViewController()
            beforeEach {
                myVC = ViewController()
            }
            
            it("should replace space with +") {
                let searchTerm = "I have spaces"
                expect(myVC.formatSearchTerm(searchTerm)).to.equal("I+have+spaces")
            }
            
            it("should replace non url friendly characters") {
                let searchTerm = "I've got non url friendly chars"
                var formattedSearch:String = myVC.formatSearchTerm(searchTerm)
                expect(StringHelper(initString: formattedSearch).indexChar("'")).to.equal(-1)
            }
        }
    }
}