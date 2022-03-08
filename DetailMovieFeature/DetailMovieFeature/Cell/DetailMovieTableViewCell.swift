//
//  DetailMovieTableViewCell.swift
//  DetailMovieFeature
//
//  Created by MEKARI on 08/03/22.
//

import UIKit

protocol TableViewCellProtocol: AnyObject {
    static var identifier: String { get }
    static func nib() -> UINib
}

class DetailMovieTableViewCell: UITableViewCell, TableViewCellProtocol {
    
    static var identifier: String = "DetailMovieTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: Bundle(for: DetailMovieTableViewCell.self))
    }
    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backdropImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backdropImageView.layer.cornerRadius = 8.0
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        backdropImageView.image = nil
    }
    
    func configure(backdropURL: String, title: String, overview: String) {
        let imageURL = "https://image.tmdb.org/t/p/w500"
        if let backdropURL = URL(string: imageURL + backdropURL) {
            backdropImageView.load(from: backdropURL)
        }
        
        titleLabel.text = title
        overviewLabel.text = overview
    }
}

extension UIImageView {
    func load(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
