# Coach API Endpoints and Responses

Please note that these endpoints are currently built without authentication. The next iteration would be to build out the authentication piece so that only an authenticated user can access these endpoints.

To see these endpoints using `Postman`, you will want to start your local server by typing into the command line `rails s`. Then you will use this URL `http://localhost:3000/api/v0` and add the desired endpoints below.

## All Tournaments

Returns an array of all tournaments.
```
get '/tournaments'
```

## Expected Response

```
{
    "data": [
        {
            "id": "1",
            "type": "tournaments",
            "attributes": {
                "name": "The Orange Classic",
                "city": "Orlando",
                "state": "FL",
                "start_date": "2021-09-05"
            },
            "relationships": {
                "teams": {
                    "data": [
                        {
                            "id": "1",
                            "type": "team"
                        },
                        {
                            "id": "2",
                            "type": "team"
                        },
                        {
                            "id": "3",
                            "type": "team"
                        }
                    ]
                },
                "players": {
                    "data": [
                        {
                            "id": "1",
                            "type": "player"
                        },
                        {
                            "id": "2",
                            "type": "player"
                        },
                        {
                            "id": "3",
                            "type": "player"
                        },
                        {
                            "id": "4",
                            "type": "player"
                        },
                        {
                            "id": "5",
                            "type": "player"
                        }
                    ]
                }
            }
        },
        {
            "id": "2",
            "type": "tournaments",
            "attributes": {
                "name": "The Turkey Classic",
                "city": "Cleveland",
                "state": "OH",
                "start_date": "2021-11-05"
            },
            "relationships": {
                "teams": {
                    "data": [
                        {
                            "id": "2",
                            "type": "team"
                        }
                    ]
                },
                "players": {
                    "data": [
                        {
                            "id": "2",
                            "type": "player"
                        },
                        {
                            "id": "5",
                            "type": "player"
                        }
                    ]
                }
            }
        },
        {
            "id": "3",
            "type": "tournaments",
            "attributes": {
                "name": "High School All American Showcase Fall",
                "city": "Denver",
                "state": "CO",
                "start_date": "2021-10-05"
            },
            "relationships": {
                "teams": {
                    "data": [
                        {
                            "id": "3",
                            "type": "team"
                        }
                    ]
                },
                "players": {
                    "data": [
                        {
                            "id": "3",
                            "type": "player"
                        }
                    ]
                }
            }
        }
    ]
}
```

## Single Tournament

Returns an individual tournament with teams included data.
```
get "/tournaments/id?included=teams"
```

## Expected Response

```
{
    "data": {
        "id": "1",
        "type": "tournaments",
        "attributes": {
            "name": "The Orange Classic",
            "city": "Orlando",
            "state": "FL",
            "start_date": "2021-09-05"
        },
        "relationships": {
            "teams": {
                "data": [
                    {
                        "id": "1",
                        "type": "team"
                    },
                    {
                        "id": "2",
                        "type": "team"
                    },
                    {
                        "id": "3",
                        "type": "team"
                    }
                ]
            },
            "players": {
                "data": [
                    {
                        "id": "1",
                        "type": "player"
                    },
                    {
                        "id": "2",
                        "type": "player"
                    },
                    {
                        "id": "3",
                        "type": "player"
                    },
                    {
                        "id": "4",
                        "type": "player"
                    },
                    {
                        "id": "5",
                        "type": "player"
                    }
                ]
            }
        }
    },
    "included": [
        {
            "id": "1",
            "type": "teams",
            "attributes": {
                "name": "Orlando Blaze",
                "age_group": "N/A"
            },
            "relationships": {
                "players": {
                    "data": [
                        {
                            "id": "1",
                            "type": "player"
                        },
                        {
                            "id": "4",
                            "type": "player"
                        }
                    ]
                }
            }
        },
        {
            "id": "2",
            "type": "teams",
            "attributes": {
                "name": "Ohio All Stars",
                "age_group": "N/A"
            },
            "relationships": {
                "players": {
                    "data": [
                        {
                            "id": "2",
                            "type": "player"
                        },
                        {
                            "id": "5",
                            "type": "player"
                        }
                    ]
                }
            }
        },
        {
            "id": "3",
            "type": "teams",
            "attributes": {
                "name": "Mile High Magic",
                "age_group": "N/A"
            },
            "relationships": {
                "players": {
                    "data": [
                        {
                            "id": "3",
                            "type": "player"
                        }
                    ]
                }
            }
        }
    ]
}
```

## Teams of each tournament with player data

Returns an array of all teams for a specific tournament, with included team rosters.
```
get "/tournaments/id/teams?included=players
```

## Expected Response

```
{
    "data": [
        {
            "id": "1",
            "type": "teams",
            "attributes": {
                "name": "Orlando Blaze",
                "age_group": "N/A"
            },
            "relationships": {
                "players": {
                    "data": [
                        {
                            "id": "1",
                            "type": "player"
                        },
                        {
                            "id": "4",
                            "type": "player"
                        }
                    ]
                }
            }
        },
        {
            "id": "2",
            "type": "teams",
            "attributes": {
                "name": "Ohio All Stars",
                "age_group": "N/A"
            },
            "relationships": {
                "players": {
                    "data": [
                        {
                            "id": "2",
                            "type": "player"
                        },
                        {
                            "id": "5",
                            "type": "player"
                        }
                    ]
                }
            }
        },
        {
            "id": "3",
            "type": "teams",
            "attributes": {
                "name": "Mile High Magic",
                "age_group": "N/A"
            },
            "relationships": {
                "players": {
                    "data": [
                        {
                            "id": "3",
                            "type": "player"
                        }
                    ]
                }
            }
        }
    ],
    "included": [
        {
            "id": "1",
            "type": "players",
            "attributes": {
                "first_name": "Tim",
                "last_name": "Smith",
                "height": 72,
                "weight": 188,
                "birthday": "2006-02-23",
                "graduation_year": 2024,
                "position": "Shooting Guard",
                "recruit": true
            }
        },
        {
            "id": "4",
            "type": "players",
            "attributes": {
                "first_name": "Omar",
                "last_name": "Brown",
                "height": 71,
                "weight": 182,
                "birthday": "2006-07-23",
                "graduation_year": 2024,
                "position": "Shooting Guard",
                "recruit": true
            }
        },
        {
            "id": "2",
            "type": "players",
            "attributes": {
                "first_name": "Dan",
                "last_name": "Holland",
                "height": 75,
                "weight": 201,
                "birthday": "2005-02-23",
                "graduation_year": 2023,
                "position": "Center",
                "recruit": true
            }
        },
        {
            "id": "5",
            "type": "players",
            "attributes": {
                "first_name": "Olaf",
                "last_name": "Schliner",
                "height": 73,
                "weight": 190,
                "birthday": "2007-04-23",
                "graduation_year": 2025,
                "position": "Forward",
                "recruit": true
            }
        },
        {
            "id": "3",
            "type": "players",
            "attributes": {
                "first_name": "Scott",
                "last_name": "Thompson",
                "height": 70,
                "weight": 175,
                "birthday": "2007-02-23",
                "graduation_year": 2025,
                "position": "Point Guard",
                "recruit": true
            }
        }
    ]
}
```
