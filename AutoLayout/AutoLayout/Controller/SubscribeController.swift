
import UIKit

class SubscribeController: UIViewController {
    
    // MARK: Variable
    
    @IBOutlet weak var imageViewBanner1: UIImageView!
    @IBOutlet weak var imageViewBanner2: UIImageView!
    private var currentIndex = 0
    private let bannerImages = ["Banner1", "Banner2"] // Your image names
    private var timer: Timer?
    var currentCellIndex = 0
    var numOfItem = 2
    var pageControlNums = 0
    
    //MARK: OUTLET
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSuscribeNow: UIButton!
    @IBOutlet weak var viewFreeTrail: UIView!{
        didSet {
            viewFreeTrail.ApplyCorner(CornerRadius: 15.0, BorderWidth: 0.0, BorderColor: .clear)
        }
    }
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pageControlCollectionView: UIPageControl! {
        didSet {
            self.pageControlCollectionView.numberOfPages = bannerImages.count
            self.pageControlCollectionView.currentPage = 0
        }
    }
    
    //MARK: WEEK Subscribe VIEW Outlet
    @IBOutlet weak var imgWeekSubscribeButton: UIImageView!
    @IBOutlet weak var btnWeekSubcribe: UIButton!
    @IBOutlet weak var lblWeekSubscribe: UILabel! {
        didSet {
            lblWeekSubscribe.ApplyShadow(ShadowRadius: 0.1, ShadowOpacity: 1.0, ShadowOffset: CGSize(width: 2, height: 2), ShadowColor: .black)
        }
    }
    @IBOutlet weak var viewWeekSubscribeSabeView: UIView! {
        didSet {
            viewWeekSubscribeSabeView.ApplyCorner(CornerRadius: 15.0, BorderWidth: 0.0, BorderColor: .clear)
            viewWeekSubscribeSabeView.backgroundColor = UIColor(red: 0.855, green: 0.804, blue: 1.000, alpha: 1.0)
        }
    }
    @IBOutlet weak var viewWeekSubscribe: UIView!{
        didSet {
            viewWeekSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 2.5, BorderColor: UIColor(red: 0.408, green: 0.145, blue: 0.949, alpha: 1.0))
        }
    }
    
    //MARK: YEAR Subscribe VIEW Outlet
    @IBOutlet weak var imgeYearSubscribeButton: UIImageView!
    @IBOutlet weak var btnYearSubscribe: UIButton!
    @IBOutlet weak var lblYearSubscribe: UILabel! {
        didSet {
            lblYearSubscribe.ApplyShadow(ShadowRadius: 2, ShadowOpacity: 1, ShadowOffset: CGSize.zero, ShadowColor: .black)
        }
    }
    @IBOutlet weak var viewYearSubscribeSabeView: UIView!{
        didSet {
            viewYearSubscribeSabeView.ApplyCorner(CornerRadius: 15.0, BorderWidth: 0.0, BorderColor: .clear)
            viewYearSubscribeSabeView.backgroundColor = UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0)
        }
    }
    @IBOutlet weak var viewYaerSubscribe: UIView!{
        didSet {
            viewYaerSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 2.5, BorderColor: UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0))
        }
    }
    
    //MARK: COLLECTION VIEW OUTLET
    
    //MARK: CONTIUE BUTTON OUTLET
    @IBOutlet weak var bntContinue: UIButton!
    @IBOutlet weak var viewContinue: UIView! {
        didSet {
            viewContinue.ApplyCorner(CornerRadius: 15, BorderWidth: 0.0, BorderColor: .clear)
            viewContinue.ApplyShadow(ShadowRadius: 1, ShadowOpacity: 1.0, ShadowOffset: CGSize(width: 2, height: 2), ShadowColor: .black)
        }
    }
    
    //MARK: CONSTANT OUTLET
    @IBOutlet weak var constaintStackSubscribe: NSLayoutConstraint!
    @IBOutlet weak var stackViewSubscribe: UIStackView!
    @IBOutlet weak var constaintSubscribeToADFree: NSLayoutConstraint!
    
    
    
    
    
    //MARK: VIEW DID LOAD ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewBanner1.frame = view.bounds
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(imageExchange), userInfo: nil, repeats: true)
        //timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(imgChangeTimer), userInfo: nil, repeats: true)
        //timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(switchImage), userInfo: nil, repeats: true)
        
        if view.frame.size.height < 750 {
            constaintSubscribeToADFree.constant = 20
            constaintStackSubscribe.constant = 140
            stackViewSubscribe.spacing = 15
        }
        //pageControlCollectionView.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        btnWeekSubcribe.addTarget(self, action: #selector(btnSubscribeTapped(_:)), for: .touchUpInside)
        btnYearSubscribe.addTarget(self, action: #selector(btnSubscribeTapped(_:)), for: .touchUpInside)
        btnCancel.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    
    
    
    
    //MARK: OBJC FUNCTION
    
    @objc private func imageExchange() {
        
        if currentCellIndex < bannerImages.count-1 {
            currentCellIndex += 1
        } else {
            currentCellIndex = 0
        }
        
        //pageControlCollectionView.currentPage = currentCellIndex
        
        currentIndex = (currentIndex + 1) % bannerImages.count
        let banner2ImageView = bannerImages[currentIndex]
        
        imageViewBanner2.image = UIImage(named: banner2ImageView)
        imageViewBanner2.frame = view.bounds.offsetBy(dx: view.bounds.width, dy: 0)

        UIView.animate(withDuration: 1.0, animations: {
            self.imageViewBanner1.frame = self.view.bounds.offsetBy(dx: -self.view.bounds.width, dy: 0)
            self.imageViewBanner2.frame = self.view.bounds
        }, completion: { _ in
            let imageViewStore = self.imageViewBanner1
            self.imageViewBanner1 = self.imageViewBanner2
            self.imageViewBanner2 = imageViewStore
            self.pageControlCollectionView.currentPage = self.currentCellIndex
        })
        
    }
    
    @objc func cancelButtonTapped () {
        dismiss(animated: true, completion: nil)
    }
    
    /*@objc func imgChangeTimer () {
        if currentCellIndex < bannerImages.count-1 {
            currentCellIndex += 1
        } else {
            currentCellIndex = 0
        }
        
        pageControlCollectionView.currentPage = currentCellIndex
    }*/

    
    /*@objc func pageControlTapped(sender: UIPageControl) {
        let page = sender.currentPage
        let indexPath = IndexPath(item: page, section: 0)
        backgroundCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }*/
    
    @objc func btnSubscribeTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            viewWeekSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 3, BorderColor: UIColor(red: 0.408, green: 0.145, blue: 0.949, alpha: 1.0))
            imgWeekSubscribeButton.image = UIImage(named: "activeButton")
            viewYaerSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 3, BorderColor: UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0))
            imgeYearSubscribeButton.image = UIImage(named: "inactiveButton")
            viewWeekSubscribeSabeView.backgroundColor = UIColor(red: 0.855, green: 0.804, blue: 1.000, alpha: 1.0)
            viewYearSubscribeSabeView.backgroundColor = UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0)
            lblWeekSubscribe.ApplyShadow(ShadowRadius: 0.1, ShadowOpacity: 1.0, ShadowOffset: CGSize(width: 2, height: 2), ShadowColor: .black)
            lblYearSubscribe.ApplyShadow(ShadowRadius: 2, ShadowOpacity: 1, ShadowOffset: CGSize.zero, ShadowColor: .black)
            //viewFreeTrail.isHidden = false
            
        case 2:
            viewYaerSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 3, BorderColor: UIColor(red: 0.408, green: 0.145, blue: 0.949, alpha: 1.0))
            imgeYearSubscribeButton.image = UIImage(named: "activeButton")
            viewWeekSubscribe.ApplyCorner(CornerRadius: 20.0, BorderWidth: 3, BorderColor: UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0))
            imgWeekSubscribeButton.image = UIImage(named: "inactiveButton")
            viewWeekSubscribeSabeView.backgroundColor = UIColor(red: 0.831, green: 0.831, blue: 0.831, alpha: 1.0)
            viewYearSubscribeSabeView.backgroundColor = UIColor(red: 0.855, green: 0.804, blue: 1.000, alpha: 1.0)
            lblWeekSubscribe.ApplyShadow(ShadowRadius: 2, ShadowOpacity: 1, ShadowOffset: CGSize.zero, ShadowColor: .black)
            lblYearSubscribe.ApplyShadow(ShadowRadius: 0.1, ShadowOpacity: 1.0, ShadowOffset: CGSize(width: 2, height: 2), ShadowColor: .black)
            //viewFreeTrail.isHidden = true
            
        default:
            return
            
        }
    }
}

//MARK: EXTENSION

