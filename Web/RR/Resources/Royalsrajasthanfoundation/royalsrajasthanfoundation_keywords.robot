*** Settings ***
Library  SeleniumLibrary
Library    String
Library    DocTest.VisualTest
Library     Screenshot
Variables  ../../PageObjects/Membership/membership_locators.py
Variables  ../../PageObjects/Login/login_page_locators.py
Resource    ../Fixtures and Results/fixturesresults_keywords.robot

*** Keywords ***
Verify Autofilled Data On Donation Form Of Elite User

