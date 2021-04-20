import UIKit
import CoreData

class ToDoListViewController: UITableViewController {
    
    var toDo = [Item]()
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var selectedCategory: Category? {
        didSet {
            loadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - TableView Creation
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier,for: indexPath)
        let item = toDo[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType =  item.isDone ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDo[indexPath.row].isDone = !toDo[indexPath.row].isDone        
        saveData()
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - constants
    let identifier = "ToDoItemCell"
    let defaultKey = "TodoListArray"
    
    //MARK: - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        let action = UIAlertAction(title: "Add Item", style: .default) { [self] (action) in
            let newItem = Item(context: context)
            newItem.title = textField.text!
            newItem.parentCategory = selectedCategory
            toDo.append(newItem)
            saveData()
            
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil
        )
    }
    //MARK: - Save Context
    func saveData() {
        do{
            try context.save()
            tableView.reloadData()
        }catch{
            print("go some errors here \(error)")
        }
    }
    
    func loadData(with request: NSFetchRequest<Item> = Item.fetchRequest(), itemPredicate: NSPredicate? = nil)  {
        do
        {
            let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
            if let _itemPredicate = itemPredicate {
                request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate,_itemPredicate])
            }else{
                request.predicate = categoryPredicate
            }
            toDo = try context.fetch(request)
            tableView.reloadData()
        } catch{
            print(error)
        }
    }
    
    
}
//MARK: - Search Bars Delegate
extension ToDoListViewController: UISearchBarDelegate
{
    fileprivate func predicate(with filter: String) -> NSPredicate {
        return NSPredicate(format: "title CONTAINS[cd] %@", filter)
    }
    fileprivate func Filter(with filter: String) -> NSFetchRequest<Item>
    {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = predicate(with: filter)
        request.sortDescriptors =  [NSSortDescriptor(key: "title", ascending: true)]
        return request
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        loadData(with: Filter(with: searchBar.text!),itemPredicate: predicate(with: searchBar.text!))
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadData()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
        else
        {
            loadData(with: Filter(with: searchBar.text!),itemPredicate: predicate(with: searchBar.text!))
        }
    }
}

