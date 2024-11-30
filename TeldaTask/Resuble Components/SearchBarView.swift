//
//  SearchBarView.swift
//  TeldaTask
//
//  Created by Taha Hussein on 30/11/2024.
//

import UIKit

protocol SearchBarViewDelegate: AnyObject {
    func didSearchTextChanged(_ text: String)
    func didTapSearchButton(with text: String)
}

class SearchBarView: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    weak var delegate: SearchBarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        if let contentView = Bundle.main.loadNibNamed("SearchBarView", owner: self, options: nil)?.first as? UIView {
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(contentView)
            searchTextField.delegate = self
        }
    }
    
    // Delegate method for when the text changes
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text ?? "") + string
        delegate?.didSearchTextChanged(currentText)
        return true
    }

    // Delegate method for when the user hits the search button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            delegate?.didTapSearchButton(with: text)
        }
        textField.resignFirstResponder()
        return true
    }
}
