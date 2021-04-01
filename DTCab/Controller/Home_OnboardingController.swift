import UIKit

class Home_OnboardingController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!{
        
        didSet{
            scrollView.delegate = self
        }
    }
    
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var timer: Timer?
    var slides:[Slide] = [];
    var currentIndexValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 18.0
        nextBtn.layer.masksToBounds = true
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeSlide), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func changeSlide() {
        currentIndexValue = currentIndexValue + 1
        if currentIndexValue < 4 {
            if currentIndexValue == 3 {
                nextBtn.setTitle("FINISH", for: .normal)
                skipBtn.isHidden = true
                timer?.invalidate()
            }
            scrollView.setContentOffset(CGPoint(x: self.view.frame.width * CGFloat(currentIndexValue), y: 0), animated: true)
        } else {
            timer?.invalidate()
        }
    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.titleLabel.text = "Request a Ride"
        slide1.imgContent.image = UIImage.init(named: "welcome1")
        slide1.imgContentHeight.constant = Display.typeIsLike == .iphone5 ? (slide1.imgContent.frame.size.height - 80) : slide1.imgContent.frame.size.height
        slide1.descLabel.text = "Request a ride get picked up by a near community driver"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imgContent.image = UIImage.init(named: "welcome2")
        slide2.imgContentHeight.constant = Display.typeIsLike == .iphone5 ? (slide1.imgContent.frame.size.height - 80) : slide1.imgContent.frame.size.height
        slide2.titleLabel.text = "Vehicle Selection"
        slide2.descLabel.text = "Users have the liberty to choose the type of vehicle as per their need"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imgContent.image = UIImage.init(named: "welcome3")
        slide3.imgContentHeight.constant = Display.typeIsLike == .iphone5 ? (slide1.imgContent.frame.size.height - 80) : slide1.imgContent.frame.size.height
        slide3.titleLabel.text = "Live Ride Tracking"
        slide3.descLabel.text = "Know your driver in advance and be able to view current location in real time on the map"
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imgContent.image = UIImage.init(named: "welcome4")
        slide4.imgContentHeight.constant = Display.typeIsLike == .iphone5 ? (slide1.imgContent.frame.size.height - 80) : slide1.imgContent.frame.size.height
        slide4.titleLabel.text = "Trip Sharing"
        slide4.descLabel.text = "Passengers can share their ride details with family and friends for safety reasons"
        return [slide1, slide2, slide3, slide4]
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if(nextBtn.title(for: .normal) == "NEXT") {
            currentIndexValue = currentIndexValue + 1
            if currentIndexValue == 3 {
                nextBtn.setTitle("FINISH", for: .normal)
                skipBtn.isHidden = true
                timer?.invalidate()
            }
            scrollView.setContentOffset(CGPoint(x: self.view.frame.width * CGFloat(currentIndexValue), y: 0), animated: true)
        } else {
            self.moveNextScreen()
        }
    }
    
    @IBAction func skipBtn(_ sender: Any) {
        self.moveNextScreen()
    }
    
    func moveNextScreen(){
        let vc = Storyboards.Main.instance.instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: scrollView.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        currentIndexValue = Int(pageIndex)
        if(currentIndexValue == 3) {
            nextBtn.setTitle("FINISH", for: .normal)
            skipBtn.isHidden = true
            timer?.invalidate()
        } else {
            nextBtn.setTitle("NEXT", for: .normal)
            skipBtn.isHidden = false
            if(pageIndex == 0){
                timer?.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeSlide), userInfo: nil, repeats: true)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        currentIndexValue = Int(pageIndex)
        if scrollView.contentOffset.y < 0 {
            self.scrollView.contentOffset.y = 0
        }
    }
}
