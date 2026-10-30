# Why Self-Host? Data Sovereignty, Privacy & Digital Footprint

## 1. The problem

Photos and documents are among the most revealing data a person produces. They show where we live, who we love, our health, our beliefs, our routines and our children's faces, often with GPS location and timestamps attached automatically as **metadata**.

When that data sits on a large company's servers:

- **You agree to their terms**, which often grant the company a broad licence to host, process and analyse your content. Policies differ by company and change over time, so *read the current ones*.
- **AI is hungry for data.** Companies are racing to train and improve machine-learning systems. Whether and how your stored content is used differs by provider, product, region and account type, and it is rarely easy to find out.
- **Profiles are built.** Even where photo *content* isn't used for ads, surrounding data (what you search, where you go, who you contact) feeds profiling.
- **You can be locked out.** Automated systems can suspend accounts, sometimes wrongly, with little human appeal. Your memories are only as safe as their policy enforcement.
- **Prices and terms drift.** Free tiers shrink or disappear. (Example to research: Google Photos ended unlimited free "high quality" storage in June 2021.) This is *subscription fatigue*: dozens of small monthly payments for access to your own data.

## 2. Key concepts

**Data sovereignty:** having meaningful control over where your data lives, who can access it, and under which laws and rules.

**Digital footprint:** the trail of data you leave. *Active* footprint is what you deliberately share; *passive* footprint is what is collected about you (metadata, device IDs, behaviour).

**Data minimisation:** collecting and keeping only what is necessary. Self-hosting lets you decide this for yourself.

**Corporate data monopolies:** when a few companies hold so much of society's data that switching is hard (lock-in) and bargaining power is lopsided.

## 3. The ethical argument

For a CAS reflection (Learning Outcome 7, ethics of choices), the argument can be framed like this:

1. **Autonomy.** People have a right to decide what happens to the record of their own lives.
2. **Informed consent.** Clicking "I agree" on a 12,000-word contract isn't meaningful consent. Teaching people what is at stake restores some of that.
3. **Power balance.** Moving from *user* to *owner* shifts the relationship, from being the product to being the customer, or neither.
4. **Collective effects.** Your photos include other people (friends, children) who never consented to being analysed. Protecting your archive also protects them.
5. **Resilience.** Distributed, small-scale infrastructure avoids single points of control and failure.

## 4. What self-hosting changes

- Your **photos and files stay on hardware you control.**
- **Immich's smart features (face grouping, search) run locally** by default, so you get "AI" convenience without sending images to a third party.
- **No advertising profile** is built from your library by the software.
- **No recurring storage fee**: only the cost of the hardware, drives and electricity.
- **Open source:** anyone can inspect the code, and the community can fix problems or fork the project.

## 5. Honest trade-offs

This section matters. A credible project doesn't oversell.

| Big-tech cloud | Self-hosted |
|---|---|
| Professional security teams | **You** are the security team |
| Redundant data centres | One machine, one location, so backups are *essential* |
| Someone else's problem when it breaks | It's *your* problem |
| Convenience, polished apps | More setup, rougher edges |
| Data mined, but it's reliably available | Data private, but only as available as your Mac mini and your internet |
| Account recovery help | If you lose the keys, **no one can help** |

**Other honest points**

- Self-hosting protects you from *corporate* mining. It does **not** make you anonymous, and your phone's OS, apps and browser still collect data.
- Poorly secured self-hosting can be **worse** than the cloud. Exposed ports, weak passwords and missed updates are real risks (see [Admin Guide](ADMIN_GUIDE.md#4-security-checklist)).
- Some software features may contact outside services (for example map tiles or update checks). **Audit the settings** and document what you find.
- The **admin has power**. Users must trust the admin, so be transparent (see [house rules](../templates&service-agreements/house-rules.md)).
- Self-hosting doesn't scale to everyone. Many people don't have the time or interest, which is why *services* like this project matter, and why policy and regulation matter too.

## 6. Questions to investigate (research prompts)

- What does the current terms of service of [Google / Apple / Meta / Microsoft] say about content licences and machine-learning use? Record the date and quote *briefly*, with links.
- What laws apply to your data where you live (e.g. GDPR in the EU/UK, or local privacy law)? What rights do they give you?
- How much metadata is in a typical phone photo? (Try an EXIF viewer on one of your own photos.)
- What's the real annual cost of cloud storage for your household over 5 years versus the hardware + electricity for a self-hosted setup?
- What's the carbon and e-waste footprint of running a home server versus using a shared data centre?

## 7. Further reading

- Electronic Frontier Foundation, *Surveillance Self-Defense*: <https://ssd.eff.org>
- Privacy Guides: <https://www.privacyguides.org>
- Immich documentation: <https://immich.app/docs>
- Nextcloud documentation: <https://docs.nextcloud.com>
- GDPR overview: <https://gdpr.eu>
- Shoshana Zuboff, *The Age of Surveillance Capitalism* (book)
