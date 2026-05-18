import SafariServices
import os.log

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems.first as? NSExtensionItem
        let message = item?.userInfo?[SFExtensionMessageKey] as? [String: Any]

        os_log(.default, "Received message from browser.runtime.sendNativeMessage: %@", message ?? [:])

        let response = NSExtensionItem()
        response.userInfo = [ SFExtensionMessageKey: [ "response": "Hello from native" ] ]

        context.completeRequest(returningItems: [response], completionHandler: nil)
    }
}