<?php
namespace portalove;

class DB
{
    private $host;
    private $dbname;
    private $username;
    private $password;
    private $port;
    private $connection;

    public function __construct($host, $dbname, $username, $password, $port = 3386)
    {
        $this->host = $host;
        $this->dbname = $dbname;
        $this->username = $username;
        $this->password = $password;
        $this->port = $port;

        try {
            $this->connection = new \PDO('mysql:host=' . $host . ';dbname=' . $dbname, $username, $password);
            $dbh = null;


        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }



    public function getCategory()
    {
        $categoryItems = [];
        $sql = "SELECT * FROM category";
        $query = $this->connection->query($sql);
        while ($row = $query->fetch()){
            $categoryItems[] = [
                "id" => $row['id'],
                "title" => $row['title'],
                "path" => $row['path'],
                "description" => $row['description'],
        ];
        }
        return $categoryItems;
    }

    public function insertCategoryItem($title, $path, $description)
    {
            $sql = "INSERT INTO category(title, path, description)
            VALUE('".$title."','".$path."','".$description."')";

        try {
            $this->connection->exec($sql);
            
            return true;

        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return false;
        }

    }
    
    
    public function deleteCategoryItem($id)
    {

        $sql = "DELETE FROM category WHERE id = ".$id;

        try {
            $this->connection->exec($sql);           
        return true;

        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return false;
        }

    }

    public function getCategoryItem($id)
    {
        $sql = "SELECT * FROM category WHERE id = " .$id;  
        try {
            $query = $this->connection->query($sql);
            $categoryItem = $query->fetch(\PDO::FETCH_ASSOC);
            
            return $categoryItem;

        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return false;
        }
    }
   
    public function updateCategoryItem($title , $path, $description, $id)
    {
        $sql = "UPDATE category SET title = '".$title."', path = '".$path."', description = '".$description."' WHERE id = ".$id;
          
        try {
            $this->connection->exec($sql);       
            return true;

        } catch (\PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            return false;
        }
    }
}
?>