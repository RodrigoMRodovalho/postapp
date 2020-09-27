//
//  BaseViewController.swift
//  PostsApp
//
//  Created by Rodrigo Rodovalho on 26/09/20.
//

import UIKit
import Swinject


//TODO move Assembler to ouside this class.
extension Assembler {
    
    static let sharedAssembler: Assembler = {
        
        let container = Container()
        let assembler = Assembler([
            PostListDependencyAssembly(),
            UseCaseDependencyAssembly(),
            DataDependencyAssembly()
        ], container: container)
        
        return assembler
    }()
    
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        injectDependencies(Assembler.sharedAssembler.resolver)
    }
    
    func injectDependencies(_ resolver: Resolver) {}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
