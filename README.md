# Everlywell backend Challenge

## Setup

1. > bundle install
2. Install neo4j `rake neo4j:install[community-4.0.6]`
3. Set password `db/neo4j/development/bin/neo4j-admin set-initial-password password`
2. Initialize neo4j server `rake neo4j:start`
3. > rails s