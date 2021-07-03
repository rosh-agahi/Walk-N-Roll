# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
* **BusinessOwner:** has many clients, has many dogwalkers, has many services
* **Client:** has many dogs
* **Dogwalker:** has many appointments
* **Dog:** has many appointments
* ~~Appointment:~~
* **Service:** has many appointments

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
* ~~BusinessOwner:~~
* **Client:** belongs to BusinessOwner
* **Dogwalker:** belongs to BusinessOwner
* **Dog:** belongs to Client  
* **Appointment:** belongs to Dog, belongs to Dogwalker, belongs to service
* **Service:** belongs to BusinessOwner

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
* **BusinessOwner:** has many appointments through Services
* **Client:** has many appointments through Dogs
* ~~Dogwalker:~~
* ~~Dog:~~
* ~~Appointment:~~
* **Service:** belongs to BusinessOwner

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
* **BusinessOwner:** has many appointments through Services
* **Client:** has many appointments through Dogs
* ~~Dogwalker:~~
* *Dog:*
* **Appointment:** belongs to BusinessOwner, belongs to Client
* *Service:*

- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)<br>
* **Appointments is the join table**
  * **User submittable attributes:**
    * Service
    * date and time of the appointment
    * cost of the appointment = Service.price + Appointment.tip

- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
**Validations:**
* BusinessOwner
* Client
* Dogwalker
* Dog
* Appointment
* Service

- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
**Revenue**
in the businessowner model:
```
def revenue
  r = 0
  prices = appointments.collect {|a| a.service.price }
  rev = prices.inject(0){|r,x| r + x }
  "$#{sprintf('%.2f',rev)}"
end
```
this is then shown on the BusinessOwner#show view

**Total Tips**
in the dogwalker model:
```
def tipped
  t = 0
  tips = appointments.collect {|a| a.tip }
  tip_total = tips.inject(0){|t,x| t + x }
  "$#{sprintf('%.2f',tips)}"
end
```
this is then shown on the Dogwalkers#show view for Tips Earned

- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
**'/clients/:id/appointments'**
nested show page for a particular client's appointments

- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
**'/dogs/:dog_id/appointments/new'**
on the client show page there is a list of the cliet's dogs. I want a button next to each dog to add a new appointment for that dog.

- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
