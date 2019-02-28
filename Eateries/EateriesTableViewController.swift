 //
 //  EateriesTableViewController.swift
 //  Eateries
 //
 //  Created by Arthur on 03.02.2019.
 //  Copyright © 2019 Arthur. All rights reserved.
 //
 
 import UIKit
 import CoreData
 
 class EateriesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    
    var fetchResultsController: NSFetchedResultsController<Restaurant>!
    var searchController: UISearchController!
    var filteredResultArray: [Restaurant] = []
    var restaurants: [Restaurant] = []
//        Restaurant(name: "Ogonek Bar", location: "Москва, Тверская улица, 21", type: "Restoran", image: "ogonek.jpg", isVisited: false),
//        Restaurant(name: "Елу", location: "Moscow", type: "Restoran", image: "elu.jpg", isVisited: false),
//        Restaurant(name: "Bonsai", location: "Moscow", type: "Restoran", image: "bonsai.jpg", isVisited: false),
//        Restaurant(name: "Dastarhan", location: "Moscow", type: "Restoran", image: "dastarhan.jpg", isVisited: false),
//        Restaurant(name: "IndoKitay", location: "Moscow", type: "Restoran", image: "indokitay.jpg", isVisited: false),
//        Restaurant(name: "X.O", location: "Moscow", type: "Restoran", image: "x.o.jpg", isVisited: false),
//        Restaurant(name: "Balkan Grill", location: "Moscow", type: "Restoran", image: "balkan.jpg", isVisited: false),
//        Restaurant(name: "Respublica", location: "Moscow", type: "Restoran", image: "respublika.jpg", isVisited: false),
//        Restaurant(name: "Speak Easy", location: "Moscow", type: "Restoran", image: "speakeasy.jpg", isVisited: false),
//        Restaurant(name: "Morris Pub", location: "Moscow", type: "Restoran", image: "morris.jpg", isVisited: false),
//        Restaurant(name: "Taste Stories", location: "Moscow", type: "Restoran", image: "istorii.jpg", isVisited: false),
//        Restaurant(name: "Classic", location: "Moscow", type: "Restoran", image: "klassik.jpg", isVisited: false),
//        Restaurant(name: "Love&Life", location: "Moscow", type: "Restoran", image: "love.jpg", isVisited: false),
//        Restaurant(name: "Shok", location: "Moscow", type: "Restoran", image: "shok.jpg", isVisited: false),
//        Restaurant(name: "Bochka", location: "Moscow", type: "Restoran ", image: "bochka.jpg", isVisited: false)
//
    
    
    @IBAction func close(segue: UIStoryboardSegue){
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    func filterContentFor(searchText text: String){
        filteredResultArray = restaurants.filter { (restaurant) -> Bool in
            return (restaurant.name?.lowercased().contains(text.lowercased()))!
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.delegate = self
        searchController.searchBar.barTintColor =  #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        searchController.searchBar.tintColor = .white
        definesPresentationContext = true
        
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableView.automaticDimension 
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext{
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
            do{
                try fetchResultsController.performFetch()
                restaurants = fetchResultsController.fetchedObjects!
            } catch let error as NSError{
                print(error.localizedDescription)
            }
            
        }
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "pageViewController") as? PageViewController{
//            present(pageViewController, animated: true, completion: nil)
//        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != ""{
            return filteredResultArray.count
        }
        return restaurants.count
    }
    
    func restaurantToDisplayAt(indexPath: IndexPath) -> Restaurant {
        var restaurant: Restaurant
        if searchController.isActive && searchController.searchBar.text != ""{
            restaurant = filteredResultArray[indexPath.row]
        } else {
            restaurant = restaurants[indexPath.row]
        }
        return restaurant
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        let restaurant = restaurantToDisplayAt(indexPath: indexPath)
        
        cell.thumbnailImageView.image = UIImage(data: restaurant.image! as Data)
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.nameLabel.text = restaurant.name
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        
        if restaurant.isVisited {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let ac = UIAlertController(title:  nil, message: "Выберите действие", preferredStyle: .actionSheet)
    //        let call = UIAlertAction(title: "Позвонить: +7 (915)237-02-3\(indexPath.row )", style: .default) {
    //            (action: UIAlertAction) -> Void in
    //            let alertC = UIAlertController(title: nil, message: "Вызов не может быть совершен", preferredStyle: .alert)
    //            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    //            alertC.addAction(ok)
    //            self.present(alertC, animated: true, completion: nil)
    //        }
    //        let isVisitedTitle = reustauranIsVisited[indexPath.row] ? "Я не был здесь" : "Я был здесь"
    //        let isVisited = UIAlertAction(title:  isVisitedTitle, style: .default) { (action) in
    //            let cell = tableView.cellForRow(at:  indexPath)
    //
    //            self.reustauranIsVisited[indexPath.row] = !self.reustauranIsVisited[indexPath.row]
    //            cell?.accessoryType = self.reustauranIsVisited[indexPath.row] ? .checkmark : .none
    //        }
    //        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
    //        ac.addAction(cancel)
    //        ac.addAction(isVisited)
    //        ac.addAction(call)
    //        present(ac, animated: true, completion: nil)
    //        tableView.deselectRow(at: indexPath, animated: true)
    //    }
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete{
    //             self.reustauranNames.remove(at: indexPath.row)
    //            self.reustauranImages.remove(at: indexPath.row)
    //            self.reustauranIsVisited.remove(at: indexPath.row)
    //        }
    //        tableView.deleteRows(at: [indexPath], with: .fade)
    //    }
    //
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .default, title: "Поделиться") {(action, indexPath) in
            let defaultText = "Я сейчас в " + self.restaurants[indexPath.row].name!
            if let image = UIImage(data: self.restaurants[indexPath.row].image! as Data) {
                let activityController = UIActivityViewController(activityItems:  [defaultText, image], applicationActivities:  nil)
                self.present(activityController, animated: true, completion: nil )
            }
        }
        let delete = UITableViewRowAction(style:  .default, title: "Удалить") { (action, indexPath) in
            self.restaurants.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext{
                let objectToDelete = self.fetchResultsController.object(at: indexPath)
                context.delete(objectToDelete)
                
                do {
                    try context.save()
                } catch let error as NSError{
                    print(error.localizedDescription)
                }
                
                
            }
        }
        share.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        return [delete, share]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! EateryDetailViewController
                dvc.restaurant  = restaurantToDisplayAt(indexPath: indexPath)
            }
        }
    }
 }
 extension EateriesTableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentFor(searchText: searchController.searchBar.text!)
        tableView.reloadData()
    }
 }
 extension EateriesTableViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar.text == ""{
            navigationController?.hidesBarsOnSwipe = false
        }
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        navigationController?.hidesBarsOnSwipe = true
    }
 }
