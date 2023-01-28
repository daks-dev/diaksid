<script lang="ts">
  import Button, { Label, Icon } from '@smui/button';
  import { YandexMetrikaHit } from 'daks-svelte';

  const title = 'DIAKSID • WEB';
  const description = 'DIAKSID: HTML, JS, CSS, Svelte, Tailwind CSS, Material UI';

  let clicked = 0;
  function handleClick(event: CustomEvent | MouseEvent) {
    event = event as MouseEvent;
    if (event.button === 0) {
      clicked++;
    }
  }
  function reset() {
    clicked = 0;
    return false;
  }
</script>

<YandexMetrikaHit
  {title}
  {description} />

<main itemprop="mainContentOfPage">
  <Button on:mousedown={handleClick}>
    <Icon class="material-icons">thumb_up</Icon>
    <Label>Click Me</Label>
  </Button>

  <p class="mdc-typography--body1">
    {#if clicked}
      You've clicked the button {clicked} time{clicked === 1 ? '' : 's'}. You can
      <a
        on:click={reset}
        href="./#">reset it</a
      >.
    {:else}
      <span class="grayed">You haven't clicked the button.</span>
    {/if}
  </p>
</main>

<style>
  .grayed {
    opacity: 0.6;
  }
</style>
