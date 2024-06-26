% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/issue.R, R/issue_close.R, R/issue_create.R,
%   R/issue_edit.R
\name{issue}
\alias{issue}
\alias{issue_close}
\alias{issue_create}
\alias{issue_edit}
\title{GitHub Issue related tools}
\usage{
issue_close(repo, number)

issue_create(repo, title, body, labels = character(), assignees = character())

issue_edit(
  repo,
  number,
  title = NULL,
  body = NULL,
  state = NULL,
  milestone = NULL,
  labels = list(),
  assignees = list()
)
}
\arguments{
\item{repo}{Character. Address of one or more repositories in \code{owner/name} format.}

\item{number}{Integer. GitHub issue number.}

\item{title}{Character. Title of the issue.}

\item{body}{Character. Content of the issue.}

\item{labels}{Character. Vector of the labels to associate with this issue}

\item{assignees}{Character. Vector of logins for users assigned to the issue.}

\item{state}{Character. State of the issue. Either "open" or "closed".}

\item{milestone}{Character. The number of the milestone to associate this issue with.
Only users with push access can set the milestone for issues. The milestone is silently dropped otherwise.}
}
\value{
All functions invisibly return a list containing the results of the relevant GitHub API call.
}
\description{
\itemize{
\item \code{issue_create} creates a new issue.
\item \code{issue_close} closes an existing issue.
\item \code{issue_edit} edits the properties of an existing issue.
}
}
\examples{
\dontrun{
repo_create("ghclass-test","test_issue")

issue_create(
  "ghclass-test/test_issue",
  title = "Issue 1",
  body = "This is an issue"
 )

issue_create(
  "ghclass-test/test_issue",
  title = "Issue 2", body = "This is also issue",
  label = "Important"
)

issue_create(
  "ghclass-test/test_issue",
  title = "Issue 3", body = "This is also issue",
  label = c("Important", "Super Important"),
  assignees = "rundel"
)

issue_close("ghclass-test/test_issue", 1)

issue_edit(
  "ghclass-test/test_issue", 2,
  title = "New issue 2 title!",
  body = "Replacement body text"
)

ghclass::repo_issues("ghclass-test/test_issue")

repo_delete("ghclass-test/test_issue", prompt=FALSE)
}
}
\seealso{
\link{repo_issues}
}
