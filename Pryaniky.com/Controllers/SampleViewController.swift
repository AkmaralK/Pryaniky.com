//
//  SampleViewController.swift
//  Pryaniky.com
//
//  Created by Akmaral on 3/7/21.
//

import UIKit

final class SampleViewController: UIViewController {

    @IBOutlet weak var sampleTableView: UITableView!
    private var dataSource: DataResultAdapter<SampleTableViewCell,DataResult>!
    private var delegate: UITableViewDelegate?
    private var viewModel = SampleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sampleTableView.dataSource = self.dataSource
        self.sampleTableView.delegate = self.delegate
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate() {
        
        self.viewModel =  SampleViewModel()
        self.viewModel.reloadTableViewClosure = {
            self.updateDataAdapter()

        }
        
    }

    func updateDataAdapter(){
           
        self.dataSource = DataResultAdapter(cellIdentifier: "SampleCellId", items: self.viewModel.listDataResult!.data, configureCell: { (cell, evm) in
            cell.nameLabel.text = evm.name
           })
           
           DispatchQueue.main.async {
               self.sampleTableView.dataSource = self.dataSource
               self.sampleTableView.delegate = self.delegate
               self.sampleTableView.reloadData()
           }
       }

        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.sampleTableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailViewController
                controller.sampleModelDetail = self.viewModel.listDataResult?.data[indexPath.row]
              
            }
        }
    }

}

