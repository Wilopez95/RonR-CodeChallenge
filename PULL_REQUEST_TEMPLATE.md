## Problem

## Solution

## Steps to Release

After merging your pull request, follow these steps to publish the repo and download a zip file of the project, so we can start sending the new version to candidates.

- [ ] Fetch the latest version of `master` locally: `git checkout master && git pull origin master`
- [ ] Find the last published tag
    - Go to [github.com/stitchfix/stitch_fix_rails_pairing](https://github.com/stitchfix/stitch_fix_rails_pairing) and click "Branch: master":
        - ![Screen_Shot_2019-10-28_at_4_22_20_PM](https://user-images.githubusercontent.com/7833470/67725933-51dd0180-f9a1-11e9-85ef-36f5845ba23a.png)
    - Click "Tags":
        - ![Screen_Shot_2019-10-28_at_4_22_34_PM](https://user-images.githubusercontent.com/7833470/67725934-52759800-f9a1-11e9-9c31-77f0421fad7d.png)
    - Note the last published tag (`v1.0.0` in the above example)
- [ ] Publish a new tag with the incremented version (`1.1.0` in this example): `rake "publish[1.1.0]"`
- [ ] Download the zip file for the published tag
    - Navigate to the published tag: [github.com/stitchfix/stitch_fix_rails_pairing/tree/v1.1.0](https://github.com/stitchfix/stitch_fix_rails_pairing/tree/v1.1.0)
    - Download the zip file:
        - ![Screen_Shot_2019-10-28_at_4_28_32_PM](https://user-images.githubusercontent.com/7833470/67725935-52759800-f9a1-11e9-822b-1ccc626ff925.png)
- [ ] Send the zip file to Kate Dramstad, and she will upload it to Box
