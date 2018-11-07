# ExBankOfSticks

An elixir application modeling a fictional Banking system that explodes anytime anything
unexpected occurs... but has really good insurance!  A explosion can be triggered
if a client walks in and tries to deposit their cat instead of money. Even though these
explosions melt the hard drives of the Bank computers they seem to always have an accurate
balance of all their clients.

This application features the fault tolerant capabilities of provided by Elixir +
Erlang. It was intentionally constructed with the intention to make the application
prone to crashes. For example, invalid user inputs can trigger a crash
(see deposit cat example above).
