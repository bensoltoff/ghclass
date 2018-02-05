## Tools for managing github class organization accounts

### Authentication

This package uses tokens for authentication with both [wercker](https://app.wercker.com/profile/tokens) and [github](https://github.com/settings/tokens), these values can be supplied via environmental variables `GITHUB_TOKEN` and `WERCKER_TOKEN` respectively or in `~/.github/token` and `~/.wercker/token`.

Alternative token locations can be specified with `set_github_token` or `set_wercker_token`.


### Example Session - Class setup

This section assumes that you have a roster file that has been read into R as a data frame, and this data frame includes a column called `github` which contains students' GitHub user names and a column called `team` that contains the team name for each student.

For example your roster file might look something like the following:

```csv
github,team
Alice,Team1
Bob,Team2
Carol,Team3
Dave,Team4
Eve,Team5
```

Using the `roster` data frame we can then invite the students to class' organzation as well as create and add them to their teams. 

```r
invite_users("Sta523-Fa17", roster$github)

## Adding Alice to Sta523-Fa17 ...
## Adding Bob to Sta523-Fa17 ...
## Adding Carol to Sta523-Fa17 ...
## Adding Dave to Sta523-Fa17 ...
## Adding Eve to Sta523-Fa17 ...
```

```r
create_teams("Sta523-Fa17", unique(d$Team))

## Adding Team1 ...
## Adding Team2 ...
## Adding Team3 ...
## Adding Team4 ...
## Adding Team5 ...
```
 
```r
add_team_member("Sta523-Fa17", roster$github, roster$team)

## Adding Alice to Team1 ...
## Adding Bob to Team2 ...
## Adding Carol to Team3 ...
## Adding Dave to Team4 ...
## Adding Eve to Team5 ...
```
 

### Example Session - Creating an assignment

```r
create_team_repos("Sta523-Fa17", prefix="hw2-")

## Creating hw2-Team01 for Team01 ...
## Creating hw2-Team02 for Team02 ...
## Creating hw2-Team03 for Team03 ...
## Creating hw2-Team04 for Team04 ...
## Creating hw2-Team05 for Team05 ...
```

```r
mirror_repo(source_repo = "Sta523-Fa17/hw2", target_repos = get_repos("Sta523-Fa17","hw2-"))

## Cloning source repo (Sta523-Fa17/hw2) ...
## Mirroring Sta523-Fa17/hw2 to Sta523-Fa17/hw2-Team01 ...
## Mirroring Sta523-Fa17/hw2 to Sta523-Fa17/hw2-Team02 ...
## Mirroring Sta523-Fa17/hw2 to Sta523-Fa17/hw2-Team03 ...
## Mirroring Sta523-Fa17/hw2 to Sta523-Fa17/hw2-Team04 ...
## Mirroring Sta523-Fa17/hw2 to Sta523-Fa17/hw2-Team05 ...
## Cleaning up ...
```

Before running the following step(s) involving Wercker make sure you've done the following:

* If you do not have one already create an account with Wercker 

* Create an organization with Wercker that will contain all of your apps for this class

* Create and save a Wercker [token](https://app.wercker.com/profile/tokens) to `~/.wercker/token`

* Make sure third party access is allowed for your github organization (See Settings / Third-party access then click on remote restrictions)

```r
add_wercker(get_repos("Sta523-Fa17", "hw2-"), "Sta523-Fa17")

## Creating wercker app for Sta523-Fa17/hw2-Team01 ...
## Creating wercker app for Sta523-Fa17/hw2-Team02 ...
## Creating wercker app for Sta523-Fa17/hw2-Team03 ...
## Creating wercker app for Sta523-Fa17/hw2-Team04 ...
## Creating wercker app for Sta523-Fa17/hw2-Team05 ...
```


### Modifying repos

```r
add_files(
  get_repos("Sta523-Fa17","hw2-"), 
  message = "Remove wrong wercker badge", 
  files = "~/Desktop/Sta523/Homework/hw2/repo/README.md"
)

## Adding files to Sta523-Fa17/hw2-Team01 ...
## Adding files to Sta523-Fa17/hw2-Team02 ...
## Adding files to Sta523-Fa17/hw2-Team03 ...
## Adding files to Sta523-Fa17/hw2-Team04 ...
## Adding files to Sta523-Fa17/hw2-Team05 ...
```
