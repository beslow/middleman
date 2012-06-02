Feature: Allow nesting of layouts

  Scenario: A page uses an inner layout when uses an outer layout
    Given the Server is running at "nested-layout-app"
    When I go to "/index.html"
    Then I should see "Template"
    And I should see "Inner"
    And I should see "Outer"
    And I should see "Master"
    When I go to "/another.html"
    And I should see "New Article Title"
    And I should see "The Article Content"
    And I should see "Inner"
    And I should see "Outer"
    And I should see "Master"
    
  Scenario: A page uses an inner layout when uses an outer layout (slim)
    Given the Server is running at "nested-layout-app"
    When I go to "/slim-test.html"
    And I should see "New Article Title"
    And I should see "The Article Content"
    And I should see "Inner"
    And I should see "Outer"
    And I should see "Master"
    
  Scenario: A page uses an inner layout when uses an outer layout (haml)
    Given the Server is running at "nested-layout-app"
    When I go to "/haml-test.html"
    And I should see "New Article Title"
    And I should see "The Article Content"
    And I should see "Inner"
    And I should see "Outer"
    And I should see "Master"

  Scenario: YAML Front Matter isn't clobbered with nested layouts
    Given the Server is running at "nested-layout-app"
    When I go to "/data-one.html"
    Then I should see "Page Number One"
    And I should see "Inner"
    When I go to "/data-two.html"
    Then I should see "Page Number Two"
    And I should not see "Inner"
    When I go to "/data-one.html"
    Then I should see "Page Number One"
    And I should see "Inner"
    When I go to "/data-two.html"
    Then I should see "Page Number Two"
    And I should not see "Inner"
