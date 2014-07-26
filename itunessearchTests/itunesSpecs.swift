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
                let searchTerm = "I`ve got non url friendly chars"
                var formattedSearch:String = myVC.formatSearchTerm(searchTerm)
                expect(StringHelper(initString: formattedSearch).indexChar("`")).to.equal(-1)
            }
            
            it("should have a function to parse JSON results from an itunes search") {               
                // {"resultCount":2,"results": [{"kind":"software"}, {"kind":"song"}]} to base64
                let myBase64Data = "eyJyZXN1bHRDb3VudCI6MiwicmVzdWx0cyI6IFt7ImtpbmQiOiJzb2Z0d2FyZSJ9LCB7ImtpbmQiOiJzb25nIn1dfQ0K"
                let searchResult: NSData = NSData(base64EncodedString: myBase64Data, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
                var formattedResults: NSArray = myVC.formatItunesSearchAsJSONArray(searchResult)
                expect(formattedResults.count).to.equal(2)
            }
            

        }
    }
}