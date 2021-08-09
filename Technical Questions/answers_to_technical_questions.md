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

3. How would you track down a performance issue in production?
  - I could look at the logs to see what is being reported. Then work to identify what would cause the issue and research ways to improve the cause. There are also gems that I could use that help track performance, such as `bullet` (which helps kill N+1 queries and unused eager loading).

Have you ever had to do this?
  - I have not yet tapped into the performance side of programming. We did touch a little bit on understanding time complexities but did not dive very deep.

4. Please describe yourself using JSON

```
{
  "first_name": "Dani",
  "last_name": "Coleman",
  "age": "You thought I'd tell ya, eh?!",
  "city": "Arvada",
  "state": "Colorado",
  "passions": [
    "Photography",
    "Nature",
    "Exploring",
    "Programming",
    "Learning"
  ],
  "dreams": [
    "To become fully awakend and raise the vibration of our planet before it is too late. To help people however I can."
  ],
}
```
