/*
 * Copyright 2019 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit

// TODO: Update to `import Firebase` once released.
import FirebaseInstallations
import FirebaseCore

class ViewController: UIViewController {
  @IBOutlet private var getInstallationButton: UIButton!
  @IBOutlet private var getAuthTokenButton: UIButton!
  @IBOutlet private var deleteInstallationButton: UIButton!
  @IBOutlet private var logTextView: UITextView!

  private var log: String = "" {
    didSet {
      logTextView?.text = log;
    }
  }

  private var installations: Installations! {
    // TODO: Update to `Installations.installations()` once implemented.
    return Installations.installations(app: FirebaseApp.app()!)
  }

  deinit {
    NotificationCenter.default.removeObserver(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }


  @IBAction func getInstallationButtonPressed() {
    log(message: "Call Installations.installationID()")
    installations.installationID { [weak self] (installationID, error) in
      self?.log(message: """
        Installations.installationID() result:
        installationID = \(String(describing: installationID))
        error = \(String(describing: error))
        """)
    }
  }

  @IBAction func getAuthTokenButtonPressed() {
    log(message: "Call Installations.authToken()")
    installations.authToken { [weak self] (authToken, error) in
      self?.log(message: """
        Installations.authToken() result:
        authToken.authToken = \(String(describing: authToken?.authToken))
        authToken.expirationDate = \(String(describing: authToken?.expirationDate))
        error = \(String(describing: error))
        """)
    }
  }

  @IBAction func deleteInstallationButtonPressed() {
    log(message: "Call Installations.delete()")
    installations.delete {[weak self] (error) in
      self?.log(message: """
        Installations.delete() result:
        \(error != nil ? String(describing: error) : "SUCCESS")
        """)
    }
  }

  // MARK: Installation update notifications
  private func subscribeForInstallationsUpdateNotifications() {
    // TODO: Implement once merged.
//    NotificationCenter.default.addObserver(self, selector: #selector(installationUpdateNotificationReceived), name: NSNotification.Name.FI, object: <#T##Any?#>)
  }

  @objc private func installationUpdateNotificationReceived() {

  }

  private func log(message: String) {
    let logMessage = "\(message)\n---\n"
    log = logMessage + log
  }
}

