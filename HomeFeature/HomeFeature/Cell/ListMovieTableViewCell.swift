//
//  ListMovieTableViewCell.swift
//  HomeFeature
//
//  Created by MEKARI on 08/03/22.
//

import UIKit

protocol TableViewCellProtocol: AnyObject {
    static var identifier: String { get }
    static func nib() -> UINib
}

class ListMovieTableViewCell: UITableViewCell, TableViewCellProtocol {

    // MARK: - Properties
    static var identifier: String = "ListMovieTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: Bundle(for: ListMovieTableViewCell.self))
    }
    
    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }
    
    func configure(posterUrl: String,
                   movieTitle: String,
                   movieDate: String,
                   movieDuration: String) {
        let imageURL = "https://image.tmdb.org/t/p/w500"
        if let posterUrl = URL(string: imageURL + posterUrl) {
            posterImageView.load(from: posterUrl)
        }
        
        titleLabel.text = movieTitle
        dateLabel.text = movieDate
        durationLabel.text = movieDuration
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
