import styled from "styled-components";
import Autocomplete from "@material-ui/lab/Autocomplete";
import Grid from "@material-ui/core/Grid";

export const Logo = styled.img`
  width: 10em;
  height: 100%;
  object-fit: cover;
  margin-bottom: 2em;
`;

export const Input = styled(Autocomplete)`
  width: 15em;
  margin-bottom: 2em;
`;

export const Item = styled(Grid)`
  padding: 1em;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-bottom: 1em;
`;

export const padding = {
  padding: "1em",
};

export const marginBottom = {
  marginBottom: "1em",
};
