|      Objects        |      Methods              | Behaviors                 |
|---------------------|---------------------------|---------------------------|
|Space                |self.all                   |                           |
|                     |self.add                   |                           |
|                     |delete                     |                           |
|---------------------|---------------------------|---------------------------|
|                     |id                         |                           |
|                     |name                       |                           | 
|                     |description                |                           |
|                     |price                      |                           |
|                     |                           |                           |
|User                 |self.add(user)             |add a user to @@users      |
|                     |self.remove(user)          |remove a user from @@users |
|                     |self.all                   |=> return array of User obj|
|                     |self.find(id)              |=> User object             |
|                     |self.log_in(email, passwd) |=> User object or false    |
|---------------------|---------------------------|---------------------------|
|                     |id                         |                           |
|                     |username                   |                           |
|                     |password                   |                           |
|                     |email                      |                           |
|                     |spaces                     |=> array of Space obj.     |


user1 = User.new

user1.delete(id)

Space.find(id) => Space object.
