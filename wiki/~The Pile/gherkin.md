---
title: Gherkin
description: Gherkin is a business readable language which helps you to describe business behavior without going into details of implementation.
---

Gherkin is a business readable language which helps you to describe business behavior without going into details of implementation. Built out of Behavior Driven Development[5], the goal is to create a document that can act as a test, the criteria, and the requirements of a feature. 

> Remember, behavior scenarios are more than tests – they also represent requirements and acceptance criteria. Good Gherkin comes from good behavior.
>
> The Golden Gherkin Rule: Treat other readers as you would want to be treated. **Write Gherkin so that people who don’t know the feature will understand it.**
>
> — Andrew Knight, automationpanda.com[3]

*NOTE: Gherkin files can actually be used as tests, but I'll be looking at them as mainly a planning and testing tool, so I won't be getting into the software here*

An example Gherkin feature[3]:

```gherkin
Feature: Google Searching

  Scenario: Search from the search bar
    Given a web browser is at the Google home page
    When the user enters "panda" into the search bar
    Then links related to "panda" are shown on the results page

  Scenario: Image search
    Given Google search results for "panda" are shown
    When the user clicks on the "Images" link at the top of the results page
    Then images related to "panda" are shown on the results page
```

Each feature of a project can stand by itself and is composed of a standard set of components.

## Feature

This is the top of your Gherkin file, describing the feature on the `Feature` line, and an optional description below. The description is essentially a comment containing a {{user story|Scrum}} regarding that feature. A basic example including a description:

```gherkin
Feature: Google Searching
  As a user, I want to search the internet for the information about a given topic, so that I can answer questions or solve problems.
```

## Background

In a feature that has multiple scenarios with the same **Given** clause, they can be placed inside of this section. THink of it sort of like a `beforeEach` from something like {{Jasmine}} or {{Jest}} but in plain language.

```gherkin
Feature: Google Searching

  Background:
    Given a web browser is at the Google home page

  Scenario: Search from the search bar
    # Given a web browser is at the Google home page
    When the user enters "panda" into the search bar
    Then links related to "panda" are shown on the results page

  Scenario: Searches using I'm Feeling Lucky
    # Given a web browser is at the Google home page
    When the user enters "panda" into the search bar
    And the user clicks I'm Feeling Lucky
    Then the web browser navigates to the first search result for "panda"
```

## Scenario

Each scenario is a self-contained set of tests or requirements that has no bearing on any other scenarios within or outside of a feature.

```gherkin
  Scenario: Search from the search bar
    Given a web browser is at the Google home page
    When the user enters "panda" into the search bar
    Then links related to "panda" are shown on the results page
```

### Given/When/Then

**Given** sets the stage for the rest of the scenario. It should ensure that a user will incur the same behavior repeatedly.

**When** a certain interaction or behavior occurs, **then** a specific outcome is expected (**and** another, **but** not this outcome).

## References

1. https://cucumber.io/docs/gherkin/reference/
1. https://www.guru99.com/gherkin-test-cucumber.html#2
1. https://automationpanda.com/2017/01/27/bdd-101-gherkin-by-example/
1. https://automationpanda.com/2017/01/30/bdd-101-writing-good-gherkin/
1. https://en.wikipedia.org/wiki/Behavior-driven_development