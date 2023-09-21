import UIKit

class ViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.insetsLayoutMarginsFromSafeArea = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = .white
        scrollView.frame = view.frame
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1800)
        scrollView.verticalScrollIndicatorInsets.top = 270 - view.safeAreaInsets.top
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = CGSize(width: scrollView.frame.width, height: scrollView.frame.height)
        return contentView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: .init(named: "image"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame.origin = .zero
        imageView.frame.size = CGSize(width:view.frame.width, height: 270)
        return imageView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        scrollView.delegate = self
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            imageView.frame.origin = CGPoint(x: 0, y: scrollView.contentOffset.y)
            imageView.frame.size = CGSize(width: view.frame.width, height: 270 - scrollView.contentOffset.y)
            scrollView.verticalScrollIndicatorInsets.top = 270 - scrollView.contentOffset.y - view.safeAreaInsets.top
        }
    }
}
