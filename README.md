# Stitch Fix Pairing Interview

## What is the purpose of the pairing interview?

The pairing interview gives you as the candidate an opportunity to collaborate with a Stitch Fix engineer on an application that addresses a real business problem at our warehouses. You'll gain an understanding of the way we work at Stitch Fix as well as our coding practices. Your interviewer will introduce the pairing feature at the start of the interview. You can think of this as if you're pairing on a story from this project's [backlog](#feature-backlog). We're excited to work on this with you!

## To Do Before the Interview

Please work through the steps in this section to set up the project. **Do not spend more than an hour on this**, even if you get stuck on the setup steps. If you get stuck, we'll help debug any setup issues during the interview. :)

1. This project uses Ruby on Rails, SQLite, and RSpec. If you don't have Ruby installed on your machine, follow the steps in [Getting Started with Ruby](./GETTING_STARTED_WITH_RUBY.md) in order to do so.

1. Run the setup script to install dependencies (gems) and set up the dev and test databases\*:

    ```bash
    $ cd [unzipped project folder location]
    $ bin/setup
    ```

    \*If this script doesn't work for you (which is a possibility on Windows machines), open the [`bin/setup`](./bin/setup) file and try running the commands individually (e.g. `bundle install`, `rails db:setup`, etc.)

1. **[Optional]** If you'd like to run the app locally, run the following command from the project directory:

    ```bash
    $ bin/rails server
    ```

    You should then be able to view the app in the browser at http://localhost:3000. If that doesn't work, check the output of the `bin/rails server` command to see if it indicates a different port other than 3000. You can test out the clearancing functionality by uploading the example CSV file in this repository (`example_csv.csv`).

1. **[Optional]** If you'd like to run the tests, run the following command from the project directory:

    ```bash
    $ bin/rspec
    ```

1. **[Optional]** Feel free to familiarize yourself with the project details in the rest of this README and the code in the repo. Again, this is completely optional, and **we don't expect you to spend more than an hour maximum on all setup and interview prep**. We're prepared to answer any questions you have about the project at the start of the interview to make sure you have everything you need to feel comfortable pairing on a feature from the [backlog](#feature-backlog).

## What problem does this application solve?

We need to clearance inventory from time to time. Certain items don't sell through to our clients, so every month, we collect certain unsold items and sell them to a third party vendor for a portion of their wholesale price.

This repository is a bare-bones application that meets that need, but it's in need of some [enhancements](#feature-backlog), which we'll work on together during the pairing interview.

## Merchandising Vocabulary

**Items** refer to individual pieces of clothing. So, if we have two of the exact same type of jeans, we have two items. Items are grouped by **style**, so the two aforementioned items would have the same style.

An item's important data is:

- Size
- Color
- Status - sellable, not sellable, sold, clearanced
- Price sold

A style's important data is:

- Wholesale price - the price we paid (per item) to acquire the style from the manufacturer
- Retail price - the original price (per item) at which we sell the style to clients
- Type - pants, shirts, dresses, skirts, etc.
- Name

The people who use this application are warehouse employees. They have a solid understanding of the business process they must carry out and look to our software to support them.

## Feature Backlog

This application currently handles clearancing items in a very basic way. A warehouse associate can upload a spreadsheet containing a list of item IDs, and those items are clearanced as a batch. When an item is clearanced, we sell it at 75% of its style's wholesale price, which we record as "price sold".

We need to make the following improvements to the app. You can think of this list as a prioritized backlog.

1. Currently, the app only handles the happy-path scenario where items can successfully be clearanced. There is some generic code that rescues errors so the page doesn't crash, but we are not explicitly handling known error cases. Some examples of errors we should handle are:
    - Item is not in the correct status ("sellable") to be clearanced
    - Item is not found

1. We'd like to avoid requiring warehouse associates to create a spreadsheet and upload it, and instead handle this process directly in the app. Since they can scan an item's barcode into any text field (as if typed directly by a keyboard), we'd like to allow them to create clearance batches simply by entering item IDs. We should also continue to support uploading a spreadsheet of item IDs for the time being. You can assume that barcode scanners work just like computer keyboards, so if the solution works by entering text with a keyboard, it will be fine for the purposes described here, i.e. don't worry about barcodes.
