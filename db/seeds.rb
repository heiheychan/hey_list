c = Category.create(name: 'Trade')
c.sub_categories.create(name: 'Apparel')
c.sub_categories.create(name: 'Book')
c.sub_categories.create(name: 'Car')
c.sub_categories.create(name: 'Electronics')
c.sub_categories.create(name: 'Furniture')
c = Category.create(name: 'People')
c.sub_categories.create(name: 'Roommate')
c.sub_categories.create(name: 'Study Buddy')
c.sub_categories.create(name: 'Travel Buddy')
c = Category.create(name: 'Lease')
c.sub_categories.create(name: 'Sublease')
c = Category.create(name: 'Other')