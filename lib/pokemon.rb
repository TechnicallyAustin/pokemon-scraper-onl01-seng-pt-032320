class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize (id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db 
    end

    def self.save
        sql = <<-SQL
        INSERT INTO pokemon (name, type, db)
        VALUES ( ?, ?, ?)
        SQL
        db.execute(sql, [name, type])
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end

def self.find(id_to_find)
    sql = <<-SQL
    SELECT * pokemon WHERE id = ?
    SQL
    db.execute(sql, id_to_find)
    
end
end
