//
//  TestView_.swift
//  MVVM_example
//
//  Created by Rusell on 26.02.2021.
//

import UIKit

class TestView: UIView {
    
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var imageView = makeImageView()
    lazy var activituIndicator = makeActivityIndicatorView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true)
            activituIndicator.isHidden = true
            activituIndicator.stopAnimating()
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            activituIndicator.isHidden = false
            activituIndicator.startAnimating()
        case .success(let success):
            update(viewData: success, isHidden: false)
            activituIndicator.isHidden = true
            activituIndicator.stopAnimating()
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
            activituIndicator.isHidden = true
            activituIndicator.stopAnimating()
            
        }
    }
    
    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        imageView.image = UIImage(named: viewData?.icon ?? "")
        titleLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
        imageView.isHidden = isHidden
    }
}
