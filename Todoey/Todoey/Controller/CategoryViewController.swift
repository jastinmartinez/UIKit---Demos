

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoy = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        Retrieve()
    }
    //MARK: - Constant
    let categoryIdentifier = "CategoryCell"
    let goToItems = "goToItems"
    
    // MARK: - TableView data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoy.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoryIdentifier, for: indexPath)
        cell.textLabel?.text = categoy[indexPath.row].name
        return cell
    }
    
   //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: goToItems, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let todoListViewController = segue.destination as! ToDoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            todoListViewController.selectedCategory = categoy[indexPath.row]
        }
    }
    //MARK: - AddButton Action
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var uiTextField = UITextField()
        let alert = UIAlertController(title: "Category", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Categoy"
            uiTextField = textField
        }
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = uiTextField.text!
            self.categoy.append(newCategory)
            self.Save()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    //MARK: - Save Func
    func Save() {
        do {
            try context.save()
            tableView.reloadData()
        } catch{
            print(error)
        }
    }
    //MARK: - Retrieve Func
    func Retrieve()  {
        let fetchData: NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categoy = try context.fetch(fetchData)
            tableView.reloadData()
        } catch  {
            print(error)
        }
    }
}
