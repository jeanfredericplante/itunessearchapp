//Testing the Quick BDD framework

import Quick
import Nimble
import itunessearch

class searchTest: QuickSpec {
    
    override func spec() {
        describe("a search function") {
            var myVC: ViewController?
            beforeEach {
                 myVC = ViewController()
            }
            
            it("should replace space with +") {
                let searchTerm = "I have spaces"
                expect(myVC.formatSearchTerm(searchTerm)).to.equal("I+have+spaces")
            }
        }
    }
}