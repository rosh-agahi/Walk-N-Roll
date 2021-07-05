# Walk-N-Roll

Walk-N-Roll is an app designed for dogwalking business owners to manage their business. The main user is an instance of the businessowner class. They can register for an account directly on the app or by verifying their account using Google's OAuth feature. Once the user logs in, they can add clients, add dogs to their clients, add any dogwalkers that they employ, add services that they offer, and create appoints for dogs. In addition to the dog, the appointment also belongs to a dogwalker and a service.

The user can create, update, and destroy all appointments. The user can also create, read and update any service item that they offer. Instead of allowing the user to delete services, I used an ActiveRecord scope method to identify any active vs archived services. By archiving a services, the user removes it from the list of available service in the new appointment form, but doesn't now remove it from the database. This keeps the app from erroring out if a service is deleted and it can't match an old appointment to a deleted service.

To see all of the Ruby on Rails project requirements and how they were met, please visit the [Project Requirements Checklist](https://github.com/rosh-agahi/Walk-N-Roll/blob/main/ProjectRequirementsChecklist.md).

## Installing

To install the app in your local environment:

1. Fork and clone the repository.
2. Load the repository in your favorite development software. I use Atom.
3. Run 'bundle install' in your terminal to install any uninstalled dependencies.
4. Run 'rails s' in your terminal to create a local environment to run and play with the app.

## Resources

* Ruby on Rails - provides the MVC framework
* ActiveRecord - database manager
* sqlite3 - database engine
* bcrypt - password hasher
* rack-flash3 - display error notices

### Used for user registration and signup through Google:
The app is not currently apprved by Gogle so any users that wish to use OAuth need to be manually added by me.

* omniauth
* omniauth-google-oauth2
* dotenv-rails

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rosh-agahi/Walk-N-Roll/

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## Authors
Roshanak Agahi - App Creator

## License
This project is licensed under the MIT License - see the LICENSE file for details
