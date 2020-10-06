//
//  BaseViewController.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import UIKit
import Swinject
import RxSwift


class BaseViewController<VM>: UIViewController, UIScrollViewDelegate {

    let disposeBag = DisposeBag()
    var viewModel: VM?
    
    var safeArea: UILayoutGuide!
    
    var scrollableTableView: UITableView!
    
    var scrollViewHandler : (() -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = Assembler.sharedAssembler.resolver.resolve(VM.self)
    }
    
    func configureView(withXibName xib: String, withReusableCellIdentifier cellId: String) {
        
        scrollableTableView = {
            let tableView = UITableView(frame: .zero, style: .plain)
            let nib = UINib(nibName: xib,bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: cellId)
            return tableView
        }()
        
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        view.addSubview(scrollableTableView)
        
        let indicator = UIActivityIndicatorView()
        scrollableTableView.backgroundView = indicator
        indicator.startAnimating()
        
        scrollableTableView.translatesAutoresizingMaskIntoConstraints = false
        scrollableTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        scrollableTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollableTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollableTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollableTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
    func createNoDataFooter(_ message: String) -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = message
        footerView.addSubview(label)
        label.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        return footerView
    }
    
    func createErrorView(withError error: Error) -> UIView {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        footerView.addSubview(stackView)

        stackView.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: footerView.trailingAnchor).isActive = true
        stackView.axis = .vertical
        

        let errorMessage = UILabel()
        errorMessage.numberOfLines = 0
        errorMessage.text = "\(Strings.errorTitle) \(error.localizedDescription)"
        stackView.addArrangedSubview(errorMessage)

        let retryInstructions = UILabel()
        retryInstructions.numberOfLines = 1
        retryInstructions.text = Strings.errorRetryText
        stackView.addArrangedSubview(retryInstructions)
        
        return footerView
    }
    
    func configureScrollHandler(handler: @escaping () -> Void){
        self.scrollViewHandler = handler
    }
    
    // MARK: - ScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (scrollableTableView.contentSize.height - scrollView.frame.size.height - 100) {
            scrollableTableView.backgroundView = nil
            scrollableTableView.tableFooterView = nil
            scrollableTableView.tableFooterView = createSpinnerFooter()
            self.scrollViewHandler()
        }
    }
}

