1. How long did you spend on the code challenge?
  - I spent approximately 40hrs working on this challenge.

What would you add to your solution if you had more time?
  - I would add authentication by learning more about how to implement JWT.
  - I would add additional endpoints which would potentially add more relationships to the schema.
  - Note that I have a branch called `player_assessment` that you can take a look at and see what I started to think/do.

2. What was the most useful feature that was added to the latest version of a language you used?
  - I really thought the generators for serializers and models is very useful.
  - With a single command I could add a migration and also have the models added.
```
rails g model Team name age_group coach
```
  - With a single command I could create the serializers directory and class set up for my serializers.
```
rails g serializer Team
```
produces
```
class TeamSerializer
  include FastJsonapi::ObjectSerializer

end
```
