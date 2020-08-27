import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics
​
class QuestionnareData {
​
    var ref = Database.database().reference()
    var target: String?
    var theme: String?
    var url: String?
​
    init? (snapshot: DataSnapshot) {
        ref = snapshot.ref
        guard let dict = snapshot.value as? [String:Any] else { return nil }
        guard let target  = dict["target"] as? String  else { return nil }
        guard let theme = dict["theme"]  as? String else { return nil }
        guard let url = dict["url"]  as? String else { return nil }
​
        self.target = target
        self.theme = theme
        self.url = url
​
    }
​
}
